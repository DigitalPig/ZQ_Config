return {
  -- Python docstring
  {
    "danymat/neogen",
    ft = { "python" },
    config = function()
      require("neogen").setup({
        enabled = true,
        languages = {
          python = {
            template = {
              annotation_convention = "numpy",
            },
          },
        },
      })
      
      -- Set python docstring style
      vim.g.python_style = "numpy"
    end,
  },

  -- Python REPL integration
  {
    "jpalardy/vim-slime",
    ft = { "python" },
    config = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_default_config = {
        socket_name = "default",
        target_pane = "{last}",
      }
      vim.g.slime_dont_ask_default = 1
      vim.g.slime_cell_delimiter = "^#\\s*-\\+$"
      
      -- Key mappings
      vim.keymap.set("n", "<leader>pc", "<Plug>SlimeSendCell", { silent = true })
      vim.keymap.set("n", "<F5>", "<Plug>SlimeLineSend", { silent = true })
      vim.keymap.set("n", "<leader>pi", function()
        vim.cmd("SlimeSend1 quit()")
      end, { silent = true })
    end,
  },

  -- iPython integration
  {
    "bfredl/nvim-ipy",
    ft = { "python" },
    config = function()
      vim.g.nvim_ipy_perform_mappings = 0
      vim.g.ipy_celldef = "^#\\s*-\\+$"
      
      -- Key mappings for IPython
      vim.keymap.set("n", "<F5>", "<Plug>(IPy-Run)", { silent = true })
      vim.keymap.set("n", "<leader>pi", "<Plug>(IPy-Interrupt)", { silent = true })
      vim.keymap.set("n", "<leader>pc", "<Plug>(IPy-RunCell)", { silent = true })
    end,
  },
}