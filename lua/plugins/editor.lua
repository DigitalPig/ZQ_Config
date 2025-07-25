return {
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        disable_netrw = true,
        hijack_netrw = true,
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
            },
          },
        },
        filters = {
          dotfiles = false,
        },
      })
    end,
  },

  -- Fuzzy finder
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        winopts = {
          height = 0.85,
          width = 0.80,
          preview = {
            default = "bat",
            border = "border",
            wrap = "nowrap",
            hidden = "nohidden",
            vertical = "down:45%",
            horizontal = "right:60%",
            layout = "flex",
            flip_columns = 120,
          },
        },
      })
    end,
  },

  -- FZF binary
  {
    "junegunn/fzf",
    build = "./install --bin",
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("telescope").setup({
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
          },
        },
      })
      require("telescope").load_extension("file_browser")
    end,
  },

  -- Toggle terminal
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
        },
      })
    end,
  },

  -- Git integration
  {
    "airblade/vim-gitgutter",
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "jreybert/vimagit",
    cmd = "Magit",
  },

  {
    "akinsho/git-conflict.nvim",
    event = "BufReadPre",
    config = function()
      require("git-conflict").setup()
    end,
  },

  -- REPL integration
  {
    "Vigemus/iron.nvim",
    ft = { "python", "julia", "r", "scheme", "lisp" },
    config = function()
      local iron = require("iron.core")
      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = {
              command = { "zsh" }
            },
            python = {
              command = { "python3" },
              format = require("iron.fts.common").bracketed_paste,
            },
            julia = {
              command = { "julia" }
            },
          },
          repl_open_cmd = require("iron.view").bottom(40),
        },
        keymaps = {
          send_motion = "<space>sc",
          visual_send = "<space>sc",
          send_file = "<space>sf",
          send_line = "<space>sl",
          send_mark = "<space>sm",
          mark_motion = "<space>mc",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>s<cr>",
          interrupt = "<space>s<space>",
          exit = "<space>sq",
          clear = "<space>cl",
        },
        highlight = {
          italic = true
        },
        ignore_blank_lines = true,
      })
    end,
  },

  -- Command line REPL
  {
    "jalvesaq/vimcmdline",
    ft = { "python", "julia", "r", "sh", "javascript" },
    config = function()
      vim.g.cmdline_map_start = "<LocalLeader>s"
      vim.g.cmdline_map_send = "<LocalLeader>t"
      vim.g.cmdline_map_send_and_stay = "<LocalLeader><LocalLeader>"
      vim.g.cmdline_map_source_fun = "<LocalLeader>f"
      vim.g.cmdline_map_send_paragraph = "<LocalLeader>p"
      vim.g.cmdline_map_send_block = "<LocalLeader>b"
      vim.g.cmdline_map_quit = "<LocalLeader>q"
    end,
  },

  -- Tmux integration
  {
    "jgdavey/tslime.vim",
    config = function()
      vim.g.tslime_ensure_trailing_newlines = 1
      vim.g.tslime_normal_mapping = "<localleader>t"
      vim.g.tslime_visual_mapping = "<localleader>t"
      vim.g.tslime_vars_mapping = "<localleader>T"
      vim.g.tslime_always_current_window = 1
      vim.g.tslime_always_current_session = 1
      vim.g.tslime_autoset_panel = 1
      
      -- Key mappings
      vim.keymap.set("v", "<C-c><C-c>", "<Plug>SendSelectionToTmux", { silent = true })
      vim.keymap.set("n", "<C-c><C-c>", "<Plug>NormalModeSendToTmux", { silent = true })
    end,
  },
}