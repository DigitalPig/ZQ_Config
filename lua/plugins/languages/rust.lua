return {
  -- Rust tools
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    config = function()
      -- Get capabilities for LSP
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      end

      vim.g.rustaceanvim = {
        inlay_hints = {
          highlight = "NonText",
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            -- Enable inlay hints if supported
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end

            vim.keymap.set("n", "<C-space>", function()
              vim.cmd.RustLsp('codeAction')
            end, { silent = true, buffer = bufnr })

            -- Toggle inlay hints
            vim.keymap.set("n", "<space>ih", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
            end, { silent = true, buffer = bufnr })
          end,
          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              check = {
                command = "clippy",
                extraArgs = { "--all-targets", "--all-features", "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ['async-trait'] = { 'async_trait' },
                  ['napi-derive'] = { 'napi' },
                  ['async-recursion'] = { 'async_recursion' },
                },
              },
            },
          },
        },
      }
    end,
  },

  -- Rust crates management
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function()
      require("crates").setup({
        text = {
          loading = "   Loading",
          version = "   %s",
          prerelease = "   %s",
          yanked = "   %s",
          nomatch = "   No match",
          upgrade = "   %s",
          error = "   Error fetching crate",
        },
      })
    end,
  },
}