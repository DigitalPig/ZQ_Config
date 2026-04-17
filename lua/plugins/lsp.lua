return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- LSP capabilities
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Workaround for Neovim 0.11 LSP sync race condition bug
      -- Error: "attempt to get length of local 'prev_line' (a nil value)"
      -- This wraps the buffer update handler to catch and suppress the error
      local original_buf_attach = vim.lsp.buf_attach_client
      vim.lsp.buf_attach_client = function(bufnr, client_id)
        local client = vim.lsp.get_client_by_id(client_id)
        if client and client.server_capabilities then
          -- Force full document sync to avoid incremental sync race conditions
          client.server_capabilities.textDocumentSync = {
            openClose = true,
            change = 1, -- 1 = Full, 2 = Incremental
            save = { includeText = true },
          }
        end
        return original_buf_attach(bufnr, client_id)
      end

      -- Workaround for claudecode.nvim + LSP buffer detachment race condition
      -- Error: "attempt to index local 'buf_state' (a nil value)" in _changetracking.lua
      -- This wraps buf_detach_client to safely handle cases where buf_state is nil
      local original_buf_detach = vim.lsp.buf_detach_client
      vim.lsp.buf_detach_client = function(bufnr, client_id)
        -- Use pcall to catch and suppress the nil buf_state error
        local ok, err = pcall(original_buf_detach, bufnr, client_id)
        if not ok then
          -- Only warn if it's not the known buf_state nil error
          if err and not string.match(tostring(err), "buf_state") then
            vim.notify("LSP detach warning: " .. tostring(err), vim.log.levels.WARN)
          end
        end
        return ok
      end

      -- Comprehensive fix for Neovim 0.11.x LSP change tracking race condition errors
      -- This patches the _changetracking module to handle various sync errors gracefully
      local ok_ct, changetracking = pcall(require, "vim.lsp._changetracking")
      if ok_ct and changetracking then
        -- Helper to check if an error is a known changetracking race condition
        local function is_changetracking_race_error(err)
          if not err then return false end
          local err_str = tostring(err)
          -- Match known race condition error patterns:
          -- 1. "buf_state" nil errors (0.11.5 and earlier)
          -- 2. "changetracking.init must have been called" (0.11.6+)
          return string.match(err_str, "buf_state")
              or string.match(err_str, "changetracking%.init must have been called")
        end

        -- Helper to wrap any changetracking function with error handling
        local function wrap_changetracking_fn(fn_name)
          if changetracking[fn_name] then
            local original_fn = changetracking[fn_name]
            changetracking[fn_name] = function(...)
              local ok, result = pcall(original_fn, ...)
              if not ok then
                if is_changetracking_race_error(result) then
                  return nil -- Silently ignore race condition errors
                end
                error(result)
              end
              return result
            end
          end
        end

        -- Wrap all known functions that can hit race conditions
        wrap_changetracking_fn("send_changes")      -- During editing
        wrap_changetracking_fn("reset_buf")         -- During detachment
        wrap_changetracking_fn("_get_and_set_name") -- During save
      end

      -- Also wrap the higher-level save handler in vim.lsp
      if vim.lsp.text_document_did_save_handler then
        local original_save_handler = vim.lsp.text_document_did_save_handler
        vim.lsp.text_document_did_save_handler = function(...)
          local ok, err = pcall(original_save_handler, ...)
          if not ok then
            local err_str = tostring(err)
            if string.match(err_str, "buf_state") or string.match(err_str, "changetracking") then
              return -- Silently ignore changetracking errors during save
            end
            error(err)
          end
        end
      end

      -- Common on_attach function
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        
        -- Diagnostic keymaps
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
        
        -- LSP keymaps
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)

        -- Setup inlay hints toggle (disabled by default)
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
          vim.keymap.set("n", "<space>ih", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
          end, { buffer = bufnr, desc = "Toggle inlay hints" })
        end
      end

      -- Configure individual language servers
      local servers = {
        "basedpyright",
        "lua_ls",
        "texlab",
      }
      -- Note: rust_analyzer is handled by rustaceanvim plugin

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end

      -- Julia LSP configuration (manual setup - more reliable than Mason's julials)
      -- Requires: julia -e "using Pkg; Pkg.add(\"LanguageServer\")"
      if vim.fn.executable("julia") == 1 then
        vim.lsp.config("julials", {
          capabilities = capabilities,
          on_attach = on_attach,
          cmd = {
            "julia",
            "--startup-file=no",
            "--history-file=no",
            "-e",
            [[
              using LanguageServer;
              server = LanguageServer.LanguageServerInstance(stdin, stdout);
              server.runlinter = true;
              run(server);
            ]]
          },
          filetypes = { "julia" },
          root_dir = function(fname)
            return vim.fs.root(fname, {".git"}) or vim.fn.getcwd()
          end,
          single_file_support = true,
        })
      end
      
      vim.lsp.config.basedpyright = {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					basedpyright = {
                        analysis = {
                          diagnosticMode = "openFilesOnly",
                          inlayHints = {
							variableTypes = true,
							functionReturnTypes = true,
							callArgumentNames = "all",
							pytestParameters = true,
						}
					},
				},
			}
                      }
      -- Lua LSP specific configuration
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
    end,
  },

  -- Mason (LSP installer)
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Mason LSP integration
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ruff",
          "ty",
          --"basedpyright",
          "lua_ls",
          "texlab",
        },
        automatic_installation = true,
      })
      -- Note: rust_analyzer is managed by rustaceanvim, not mason-lspconfig
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "html",
          "javascript",
          "json",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
          "rust",
          "julia",
          "r",
          "latex",
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
}
