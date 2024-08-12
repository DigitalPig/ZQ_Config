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
" Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', {'branch': 'main'}
" Plug 'cjrh/vim-conda'
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
Plug 'w0rp/ale'
Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
Plug 'jalvesaq/Nvim-R'
Plug 'jalvesaq/vimcmdline'
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'airblade/vim-gitgutter'
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimfiler.vim'
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/echodoc.vim'
"Plug 'Shougo/denite.nvim'
Plug 'jreybert/vimagit'
"Plug 'neovim/nvim-lspconfig'
"Plug 'Shougo/deoplete-lsp'
"Plug 'lambdalisue/gina.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" MIT Scheme
Plug 'vim-scripts/paredit.vim', { 'for': ['scheme', 'lisp', 'racket'] }
Plug 'jgdavey/tslime.vim'

" You'll need vim-sexp too for selecting forms.
"Plug 'guns/vim-sexp'

" And while you're here, tpope's bindings make vim-sexp a little nicer to use.
"Plug 'tpope/vim-sexp-mappings-for-regular-people'

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
"Plug 'nathanaelkane/vim-indent-guides'
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

" Python docstring
Plug 'pixelneo/vim-python-docstring'

" Copilot
Plug 'github/copilot.vim'

" Snippet support
Plug 'SirVer/ultisnips'

" Snippet collection
Plug 'honza/vim-snippets'

" Rust
Plug 'simrat39/rust-tools.nvim'
Plug 'timonv/vim-cargo'
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'puremourning/vimspector'

" Quarto
Plug 'quarto-dev/quarto-nvim',
Plug 'jmbuhr/otter.nvim',
Plug 'hrsh7th/nvim-cmp',
" Plug 'nvim-treesitter/nvim-treesitter'

" LSP 
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Terminals
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'lukas-reineke/indent-blankline.nvim'
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


" Deoplete
"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"set completeopt=longest,preview

let g:lsp_highlights_enabled=1
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

" VIM-Ipython setup
let g:nvim_ipy_perform_mappings=0
map <silent> <F5> <Plug>(IPy-Run)
nmap <silent> <leader>pi <Plug>(IPy-Interrupt)
nmap <silent> <leader>pt <Plug>(IPy-Terminate)

let g:ipy_celldef = '^#\s*-+$'
map <silent> <leader>pc <Plug>(IPy-RunCell)

" Gina Airline setup
"call airline#parts#define_function('gina', 'gina#component#repo#branch')
"let g:airline_section_b = airline#section#create(['hunks', g:airline_symbols.branch,'gina'])

" Vimfiler setup
"
"let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_ignore_pattern = ['^\.', '^__pycache__$']
"autocmd BufEnter * map <f3> :VimFilerExplorer -toggle -simple -winwidth=35<CR>
"autocmd BufEnter * map <f3> :Defx -toggle -split=vertical -winwidth=28 -direction=topleft<CR>
"autocmd FileType defx call s:defx_my_settings()
"	function! s:defx_my_settings() abort
	  " Define mappings
"	  nnoremap <silent><buffer><expr> <CR>
"	  \ defx#do_action('drop')
"	  nnoremap <silent><buffer><expr> c
"	  \ defx#do_action('copy')
"	  nnoremap <silent><buffer><expr> m
"	  \ defx#do_action('move')
"	  nnoremap <silent><buffer><expr> p
"	  \ defx#do_action('paste')
"	  nnoremap <silent><buffer><expr> l
"	  \ defx#do_action('drop')
"	  nnoremap <silent><buffer><expr> V
"	  \ defx#do_action('drop', 'vsplit')
"      nnoremap <silent><buffer><expr> s
"     \ defx#do_action('drop', 'split')
"	  nnoremap <silent><buffer><expr> P
"	  \ defx#do_action('open', 'pedit')
"	  nnoremap <silent><buffer><expr> o
"	  \ defx#do_action('open_tree', 'toggle')
"	  nnoremap <silent><buffer><expr> K
"	  \ defx#do_action('new_directory')
"	  nnoremap <silent><buffer><expr> N
"	  \ defx#do_action('new_file')
"	  nnoremap <silent><buffer><expr> M
"	  \ defx#do_action('new_multiple_files')
"	  nnoremap <silent><buffer><expr> C
"	  \ defx#do_action('toggle_columns',
"	  \                'mark:indent:icon:filename:type:size:time')
"	  nnoremap <silent><buffer><expr> S
"	  \ defx#do_action('toggle_sort', 'time')
"	  nnoremap <silent><buffer><expr> d
"	  \ defx#do_action('remove')
"	  nnoremap <silent><buffer><expr> r
"	  \ defx#do_action('rename')
"	  nnoremap <silent><buffer><expr> !
"	  \ defx#do_action('execute_command')
"	  nnoremap <silent><buffer><expr> x
"	  \ defx#do_action('execute_system')
"	  nnoremap <silent><buffer><expr> yy
"	  \ defx#do_action('yank_path')
"	  nnoremap <silent><buffer><expr> .
"	  \ defx#do_action('toggle_ignored_files')
"	  nnoremap <silent><buffer><expr> ;
"	  \ defx#do_action('repeat')
"	  nnoremap <silent><buffer><expr> h
"	  \ defx#do_action('cd', ['..'])
"	  nnoremap <silent><buffer><expr> ~
"	  \ defx#do_action('cd')
"	  nnoremap <silent><buffer><expr> q
"	  \ defx#do_action('quit')
"	  nnoremap <silent><buffer><expr> <Space>
"	  \ defx#do_action('toggle_select') . 'j'
"	  nnoremap <silent><buffer><expr> *
"	  \ defx#do_action('toggle_select_all')
"	  nnoremap <silent><buffer><expr> j
"	  \ line('.') == line('$') ? 'gg' : 'j'
"	  nnoremap <silent><buffer><expr> k
"	  \ line('.') == 1 ? 'G' : 'k'
"	  nnoremap <silent><buffer><expr> <C-l>
"	  \ defx#do_action('redraw')
"	  nnoremap <silent><buffer><expr> <C-g>
"	  \ defx#do_action('print')
"	  nnoremap <silent><buffer><expr> cd
"	  \ defx#do_action('change_vim_cwd')
"  endfunction




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
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_base_dir = '/home/digitalpig/.config/nvim/plugged/vimspector'
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

lua << EOF

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

  -- Set up nvim-cmp.
  local cmp = require'cmp'

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
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
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


require('lspconfig')['tsserver'].setup{
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

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<Leader>s", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

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

EOF

