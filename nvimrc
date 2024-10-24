set nocompatible hidden laststatus=2 number relativenumber ts=4 sw=4 et
set guicursor+=n-v-c:blinkon0
set colorcolumn=80,120
filetype on
filetype plugin on
let mapleader = ";"
" Default localleader to the leader currently
let maplocalleader = "\\"

if !filereadable('/home/digitalpig/.config/nvim/plugged/plug.vim')
  silent !curl --insecure -fLo /home/digitalpig/.config/nvim/plugged/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

source /home/digitalpig/.config/nvim/plugged/plug.vim

call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'folke/tokyonight.nvim', {'branch': 'main'}
Plug 'w0rp/ale'
Plug 'prabirshrestha/async.vim'
Plug 'jalvesaq/Nvim-R'
Plug 'jalvesaq/vimcmdline'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" MIT Scheme
Plug 'vim-scripts/paredit.vim', { 'for': ['scheme', 'lisp', 'racket'] }
Plug 'jgdavey/tslime.vim'

" File Explorer
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" Autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Lint and Format
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'


" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'


" Kubernetes
Plug 'c9s/helper.vim'
Plug 'c9s/treemenu.vim'
Plug 'c9s/vikube.vim'

" Helm
Plug 'towolf/vim-helm'

"Docker and Dockerfile
Plug 'ekalinin/Dockerfile.vim'
Plug 'kevinhui/vim-docker-tools'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sillybun/zytutil'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'AtsushiSakai/julia.vim'
Plug 'alfredodeza/pytest.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'

Plug 'hashivim/vim-hashicorp-tools'

Plug 'janko-m/vim-test'

" Coverage
Plug 'google/vim-maktaba'
Plug 'google/vim-coverage'
Plug 'google/vim-glaive'
Plug 'KabbAmine/zeavim.vim'
Plug 'bfredl/nvim-ipy'

Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'psf/black'

" Leetcode
Plug 'ianding1/leetcode.vim'

" Python related
Plug 'pixelneo/vim-python-docstring'
Plug '3rd/image.nvim'
Plug 'benlubas/molten-nvim', {'version': '^1.0.0'}
Plug 'kmontocam/nvim-conda'
" Copilot and other code completion process
" Plug 'github/copilot.vim'
Plug 'zbirenbaum/copilot.lua'
Plug 'zbirenbaum/copilot-cmp'
Plug 'CopilotC-Nvim/CopilotChat.nvim'
" Plug 'milanglacier/minuet-ai.nvim'
" Plug 'olimorris/codecompanion.nvim'

" Snippet support
Plug 'SirVer/ultisnips'

" Snippet collection
Plug 'honza/vim-snippets'

" Rust
"Plug 'simrat39/rust-tools.nvim'
Plug 'mrcjkb/rustaceanvim', {'version': '^5'}
Plug 'timonv/vim-cargo'
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'
" Plug 'puremourning/vimspector'
Plug 'Vigemus/iron.nvim'


" Quarto
Plug 'quarto-dev/quarto-nvim',
Plug 'jmbuhr/otter.nvim',
Plug 'hrsh7th/nvim-cmp',
" Plug 'nvim-treesitter/nvim-treesitter'

" LSP 
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'


" Terminals
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'stevearc/dressing.nvim'
call plug#end()

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=python3complete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

lua require'lspconfig'.rust_analyzer.setup{}


" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
call glaive#Install()
Glaive coverage plugin[mappings]
"let g:deoplete#enable_at_startup = 1
"let g:echodoc#enable_at_startup=1
"let g:echodoc#type='virtual'
"let g:ale_completion_enabled=0
let g:rainbow_active=1
" Language Server Setting
set hidden

"imap <c-space> <Plug>(asyncomplete_force_refresh)
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


"function ChangeCondaEnv()
"    CondaChangeEnv
"    if exists("$CONDA_DEFAULT_ENV")
"        let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
"    else
"        let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
"    endif
    " Stop the existing server
"    call lsp#stop_server("pylsp")
"    if executable('pylsp')
"    " pip install python-language-server
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'pylsp',
"        \ 'cmd': {server_info->['pylsp']},
"        \ 'whitelist': ['python'],
"        \ 'blacklist': ['julia']
"        \ })
"    endif
"    call lsp#disable()
"    call lsp#enable()
"    call ale#toggle#Disable()
"    call ale#toggle#Enable()
"endfunction

" autocmd FileType python map <F6> :call ChangeCondaEnv()<CR>

"if executable('julials')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'julials',
"        \ 'cmd': {server_info->['julials']},
"        \ 'whitelist': ['julia'],
"        \ 'blacklist': ['python']
"        \ })
"endif
"if executable('pyls')
    " pip install python-language-server
"    au User lsp_setup call lsp#register_server({
"       \ 'name': 'pyls',
"       \ 'cmd': {server_info->['pylsp']},
"       \ 'whitelist': ['python'],
"       \ 'blacklist': ['julia']
"       \ })
"endif

"autocmd FileType julia setlocal omnifunc=lsp#complete

" Vim Color
set noshowmode
set background=dark
" colorscheme gruvbox
colorscheme tokyonight

" Vim Airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

" NerdTree integration
" let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


" Python Mode Setup
let b:ale_fixers = {'javascript': ['prettier', 'eslint'],
			\ 'python': ['black', 'yapf']}

" LaTeX
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Vim syntax
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
let g:lsp_auto_enable=1
"set completeopt+=preview
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"let g:default_julia_version = "current"

    " Pass a dictionary to set multiple options
"    call deoplete#custom#option({
"    \ 'auto_complete_delay': 200,
"    \ 'smart_case': v:true,
"    \ })


let g:lsp_highlights_enabled=1

" VIM-Ipython setup
let g:nvim_ipy_perform_mappings=0
map <silent> <F5> <Plug>(IPy-Run)
nmap <silent> <leader>pi <Plug>(IPy-Interrupt)
nmap <silent> <leader>pt <Plug>(IPy-Terminate)

let g:ipy_celldef = '^#\s*-+$'
map <silent> <leader>pc <Plug>(IPy-RunCell)


" Clipboard
set clipboard+=unnamedplus

" Neosnippet
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" Debug julia LSP
" let g:lsp_log_verbose = 0
" let g:lsp_log_file = expand('~/vim-lsp.log')

" Leetcode setup
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

let g:leetcode_solution_filetype="python3"
let g:leetcode_username="digitalpig"
let g:leetcode_browser="firefox"

" MIT Scheme
" Format the indentation
autocmd filetype lisp,scheme,art,racket setlocal equalprg=scmindent.rkt
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<localleader>t'
let g:tslime_visual_mapping = '<localleader>t'
let g:tslime_vars_mapping = '<localleader>T'
" Starts the REPL.
"let g:paredit_mode = 0

" Bracket motion disable
"let g:sexp_enable_insert_mode_mappings = 0

" Python docstring
let g:python_style="numpy"

" Snippet Setting
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" LSP settings
map <F12> :LspImplementation<CR>
map <S-F12> :LspPeekImplementation<CR>


" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc


" TSlime setting

let g:tslime_always_current_window = 1
let g:tslime_always_current_session = 1
let g:tslime_autoset_panel=1
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" Vimspector Settings
"
"let g:vimspector_enable_mappings = 'HUMAN'
"let g:vimspector_base_dir = '/home/digitalpig/.config/nvim/plugged/vimspector'
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" Telescope setup 
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>sf <cmd>Telescope git_files<cr>
nnoremap <leader>ss <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>sw <cmd>Telescope lsp_workspace_symbols<cr>
nnoremap <leader>fe <cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>

" Debug NVIM-DAP
nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
nnoremap <silent> <leader>db :lua require('dap').toggle_breakpoint()<CR>
nnoremap <silent> <F5> :lua require('dap').continue()<CR>
nnoremap <silent> <S-F5> :lua require('dap').terminate()<CR>
nnoremap <silent> <F11> :lua require('dap').step_into()<CR>
nnoremap <silent> <S-F12> :lua require('dap').step_out()<CR>
nnoremap <silent> <F10> :lua require('dap').step_over()<CR>
nnoremap <silent> <leader>dr :lua require('dap').repl.open()<CR>

vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

nnoremap <leader>ccb <cmd>CopilotChatBuffer<cr>
nnoremap <leader>cce <cmd>CopilotChatExplain<cr>
nnoremap <leader>cct <cmd>CopilotChatTests<cr>
xnoremap <leader>ccv :CopilotChatVisual<cr>
xnoremap <leader>ccx :CopilotChatInPlace<cr>


" Begining of LUA section setup

lua << EOF

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- molten related setup
vim.g.molten_image_provider = "image.nvim"
vim.g.molten_output_win_max_height = 20
--require('molten.status').initialized() -- "Molten" or "" based on initialization information
--require('molten.status').kernels() -- "kernel1 kernel2" list of kernels attached to buffer or ""


-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

----
--require('minuet').setup({
--    provider = 'claude',
-- })

  -- Set up nvim-cmp.
  local cmp = require'cmp'

 local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-m>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--      ['<C-l>'] = require('minuet').make_cmp_map(),
      ["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end)
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
        { name = "copilot"},  
        --{ name = 'minuet' },
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })


---- LSP setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup()
      local mason_lspconfig = require 'mason-lspconfig'
      mason_lspconfig.setup {
        ensure_installed = { "pyright" }
      }
      require("lspconfig").pyright.setup {
        capabilities = capabilities,
      }

----


require('lspconfig')['ts_ls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
--[[
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
-]]

require('lspconfig')['julials'].setup{}

--local rt = require("rust-tools")

--rt.setup({
--  server = {
--    on_attach = function(_, bufnr)
      -- hover actions
--      vim.keymap.set("n", "<leader>s", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- code action groups
--      vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--    end,
--  },
--})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.completion.spell,
    },
})

require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
}

require('lualine').setup()

vim.opt.termguicolors = true
require("bufferline").setup{}

require("nvim-treesitter.configs").setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript", "rust", "julia", "json", "yaml" },
      auto_install = false,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-n>",
          node_incremental = "<C-n>",
          scope_incremental = "<C-s>",
          node_decremental = "<C-m>",
        }
        }
      }
    ) 

require("ibl").setup()

require("telescope").setup{
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case"
      }
      }}

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"

-- File managers
require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      hidden = { file_browser = false, folder_browser = true },
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"


-- default config
require("image").setup({
  backend = "kitty",
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
    },
    neorg = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { "norg" },
    },
    html = {
      enabled = false,
    },
    css = {
      enabled = false,
    },
  },
  max_width = 100,
  max_height = 12,
  max_width_window_percentage = math.huge,
  max_height_window_percentage = math.huge,
  window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})

-- Iron is a interactive REPL over Neovim

require("iron.core").setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      },
      python = {
        command = { "ipython", "--no-autoindent" },
        format = require("iron.fts.common").bracketed_paste_python
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = require('iron.view').split.rightbelow(0.25)
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_paragraph = "<space>sp",
    send_until_cursor = "<space>su",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')

-- Copilot 
require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

require("copilot_cmp").setup()
local copilot_chat = require("CopilotChat")
copilot_chat.setup({
  debug = true,
  show_help = "yes",
  prompts = {
    Explain = "Explain how it works by Japanese language.",
    Review = "Review the following code and provide concise suggestions.",
    Tests = "Briefly explain how the selected code works, then generate unit tests.",
    Refactor = "Refactor the code to improve clarity and readability.",
  },
  build = function()
    vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
  end,
  event = "VeryLazy",
})



--require("codecompanion").setup({
--  strategies = {
--    chat = {
--      adapter = "anthropic",
--    },
--    inline = {
--      adapter = "anthropic",
--    },
--    agent = {
--      adapter = "anthropic",
--    },
--  },
--})

require("dressing").setup()
local dap = require('dap')
local dapui = require('dapui')
dapui.setup()
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/home/digitalpig/.local/bin/codelldb/extension/adapter/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

require("dap-python").setup("python3")


vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
      require('dap.ui.widgets').hover()
    end)
    vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
      require('dap.ui.widgets').preview()
    end)
    vim.keymap.set('n', '<Leader>df', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set('n', '<Leader>ds', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end)


-- Terminal setting for lazygit

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ 
                    cmd = "lazygit", 
                    hidden = true, 
                    direction = "float",
                    float_opts = {
                        border = "double",
                    } 
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

EOF



