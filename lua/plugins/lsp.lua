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

			-- Configure diagnostics to be hidden by default
			vim.diagnostic.config({
				virtual_text = false,  -- Hide inline diagnostics
				signs = true,          -- Keep gutter signs
				underline = true,      -- Keep underlines
				update_in_insert = false,
			})

			-- Global diagnostic keymaps
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

			-- LSP capabilities
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Common on_attach function
			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, silent = true }

				-- Enable inlay hints if supported
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end

				-- LSP keymaps
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, opts)

				-- Toggle inlay hints
				vim.keymap.set("n", "<space>ih", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
				end, opts)
			end

			-- Configure TexLab
			vim.lsp.config.texlab = {
				capabilities = capabilities,
				on_attach = on_attach,
			}

			-- BasedPyright specific configuration
			vim.lsp.config.basedpyright = {
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					basedpyright = {
						inlayHints = {
							variableTypes = true,
							functionReturnTypes = true,
							callArgumentNames = "all",
							pytestParameters = true,
						}
					}
				}
			}

			-- Lua LSP specific configuration
			vim.lsp.config.lua_ls = {
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
			}

			-- Julia LSP configuration (using Mason's julia-lsp)
			vim.lsp.config.julials = {
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = function()
					-- Use Mason's julia-lsp with current project or default environment
					local mason_julia_lsp = vim.fn.stdpath("data") .. "/mason/bin/julia-lsp"
					local project_path = vim.fn.getcwd()
					if vim.fn.filereadable(project_path .. "/Project.toml") == 1 then
						return { mason_julia_lsp, project_path }
					else
						-- Let julia-lsp auto-detect the environment
						return { mason_julia_lsp }
					end
				end,
			}
		end,
	},

	-- Mason (LSP installer)
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ensure_installed = {
					"basedpyright",
					"lua-language-server",
					"texlab",
					"stylua",
					"ruff",
					"isort",
					"prettier",
				},
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
					"basedpyright",
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
