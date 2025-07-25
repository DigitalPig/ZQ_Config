return {
  -- R support
  {
    "R-nvim/R.nvim",
    ft = { "r", "rmd" },
    config = function()
      require("r").setup({
        R_args = {"--quiet", "--no-save"},
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          end
        },
        min_editor_width = 72,
        rconsole_width = 78,
        objbr_mappings = {
          c = 'class',
          ['<localleader>gg'] = 'head({object}, n = 15)',
          v = 'vim.inspect',
        },
        disable_cmds = {
          "RClearConsole",
          "RCustomStart",
          "RSPlot",
          "RSaveClose",
        },
      })
    end,
  },

  -- Julia support (temporarily disabled due to LaTeX function conflicts)
  -- Use julials LSP + cmp-latex-symbols for Julia development instead
  {
    "JuliaEditorSupport/julia-vim",
    enabled = false,
    ft = { "julia" },
    config = function()
      vim.g.latex_to_unicode_auto = 1
      vim.g.latex_to_unicode_eager = 1
    end,
  },

  -- Modern LaTeX symbol completion (alternative to julia-vim's LaTeX conversion)
  {
    "kdheepak/cmp-latex-symbols",
    ft = { "julia", "latex", "tex" },
    dependencies = { "hrsh7th/nvim-cmp" },
  },

  -- LaTeX support
  {
    "lervag/vimtex",
    ft = { "tex", "latex", "plaintex" },
    config = function()
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_conceal = 'abdmg'
      vim.opt.conceallevel = 1
    end,
  },

  -- Helm charts
  {
    "towolf/vim-helm",
    ft = { "helm" },
  },

  -- Markdown support
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = ''
      vim.g.mkdp_browser = ''
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = ''
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = 'middle',
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0
      }
      vim.g.mkdp_markdown_css = ''
      vim.g.mkdp_highlight_css = ''
      vim.g.mkdp_port = ''
      vim.g.mkdp_page_title = '「${name}」'
    end,
  },

  -- YAML support
  {
    "stephpy/vim-yaml",
    ft = { "yaml", "yml" },
  },

  -- TOML support
  {
    "cespare/vim-toml",
    ft = { "toml" },
  },

  -- Dockerfile support
  {
    "ekalinin/Dockerfile.vim",
    ft = { "dockerfile" },
  },

  -- Lisp/Scheme support
  {
    "kovisoft/paredit",
    ft = { "lisp", "scheme", "racket", "clojure" },
    config = function()
      vim.g.paredit_mode = 0
    end,
  },

  {
    "guns/vim-sexp",
    ft = { "lisp", "scheme", "racket", "clojure" },
    config = function()
      vim.g.sexp_enable_insert_mode_mappings = 0
    end,
  },

  -- JavaScript/TypeScript
  {
    "pangloss/vim-javascript",
    ft = { "javascript", "javascript.jsx" },
  },

  {
    "leafgarland/typescript-vim",
    ft = { "typescript", "typescript.tsx" },
  },

  -- Go support
  {
    "fatih/vim-go",
    ft = { "go" },
    build = ":GoUpdateBinaries",
    config = function()
      vim.g.go_highlight_types = 1
      vim.g.go_highlight_fields = 1
      vim.g.go_highlight_functions = 1
      vim.g.go_highlight_function_calls = 1
      vim.g.go_highlight_operators = 1
      vim.g.go_highlight_extra_types = 1
    end,
  },
}