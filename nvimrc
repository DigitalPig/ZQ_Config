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
Plug 'morhetz/gruvbox'
Plug 'cjrh/vim-conda'
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
Plug 'w0rp/ale'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'jalvesaq/Nvim-R'
Plug 'jalvesaq/vimcmdline'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'airblade/vim-gitgutter'
"Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/denite.nvim'
Plug 'lambdalisue/gina.vim'

" MIT Scheme
Plug 'vim-scripts/paredit.vim', { 'for': ['scheme', 'lisp', 'racket'] }
Plug 'sjl/tslime.vim'

" You'll need vim-sexp too for selecting forms.
"Plug 'guns/vim-sexp'

" And while you're here, tpope's bindings make vim-sexp a little nicer to use.
"Plug 'tpope/vim-sexp-mappings-for-regular-people'


" Kubernetes
Plug 'c9s/helper.vim'
Plug 'c9s/treemenu.vim'
Plug 'c9s/vikube.vim'

" Helm
Plug 'towolf/vim-helm'

"Docker and Dockerfile
Plug 'ekalinin/Dockerfile.vim'
Plug 'kevinhui/vim-docker-tools'


Plug 'sillybun/zytutil'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'AtsushiSakai/julia.vim'
Plug 'alfredodeza/pytest.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'nathanaelkane/vim-indent-guides'
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
"Plug 'psf/black'

" Leetcode
Plug 'ianding1/leetcode.vim'

" Python docstring
Plug 'pixelneo/vim-python-docstring'


" Snippet support
Plug 'SirVer/ultisnips'

" Snippet collection
Plug 'honza/vim-snippets'
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

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
call glaive#Install()
Glaive coverage plugin[mappings]
let g:deoplete#enable_at_startup = 1
let g:echodoc#enable_at_startup=1
let g:echodoc#type='virtual'
let g:ale_completion_enabled=1
let g:rainbow_active=1
" Language Server Setting
set hidden

"imap <c-space> <Plug>(asyncomplete_force_refresh)
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


function ChangeCondaEnv()
    CondaChangeEnv
    if exists("$CONDA_DEFAULT_ENV")
        let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
    else
        let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
    endif
    " Stop the existing server
    call lsp#stop_server("pyls")
    if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'blacklist': ['julia']
        \ })
    endif
    call lsp#disable()
    call lsp#enable()
    call ale#toggle#Disable()
    call ale#toggle#Enable()
endfunction

autocmd FileType python map <F6> :call ChangeCondaEnv()<CR>

if executable('julials')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'julials',
        \ 'cmd': {server_info->['julials']},
        \ 'whitelist': ['julia'],
        \ 'blacklist': ['python']
        \ })
endif
"if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
       \ 'name': 'pyls',
       \ 'cmd': {server_info->['pyls']},
       \ 'whitelist': ['python'],
       \ 'blacklist': ['julia']
       \ })
"endif

"autocmd FileType julia setlocal omnifunc=lsp#complete

" Vim Color
set noshowmode
set background=dark
colorscheme gruvbox

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
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:default_julia_version = "current"

    " Pass a dictionary to set multiple options
    call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ })


" Deoplete
"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
set completeopt=longest,preview

let g:lsp_highlights_enabled=1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" VIM-Ipython setup
let g:nvim_ipy_perform_mappings=0
map <silent> <F5> <Plug>(IPy-Run)
nmap <silent> <leader>pi <Plug>(IPy-Interrupt)
nmap <silent> <leader>pt <Plug>(IPy-Terminate)

let g:ipy_celldef = '^#\s*-+$'
map <silent> <leader>pc <Plug>(IPy-RunCell)

" Gina Airline setup
call airline#parts#define_function('gina', 'gina#component#repo#branch')
let g:airline_section_b = airline#section#create(['hunks', g:airline_symbols.branch,'gina'])

" Vimfiler setup
"
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = ['^\.', '^__pycache__$']
autocmd BufEnter * map <f3> :VimFilerExplorer -toggle -simple -winwidth=35<CR>

" Clipboard
set clipboard+=unnamedplus

" Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Debug julia LSP
let g:lsp_log_verbose = 0
let g:lsp_log_file = expand('~/vim-lsp.log')

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
