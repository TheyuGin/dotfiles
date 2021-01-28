" vim: foldmethod=marker

" {{{ Plugin setup
"
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'dracula/vim', {'name': 'dracula'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'chrisbra/Colorizer'
Plug 'psf/black', {'branch': 'stable'}
call plug#end()
" }}}

" {{{ General settings
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'
let g:dracula_colorterm = 0
colorscheme dracula
syntax on
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes
set autoindent			" autoindent duh
set shiftround 			" round indent to multime of 'shiftwidth'
set expandtab			" tab is spaces
set softtabstop=4		" soft tab 4 col
set tabstop=4			" hard tab 4 col
set shiftwidth=4 		" operation >> indents 4 col, << unindents 4
set textwidth=79		" lines longer 79 col will be broken
set noswapfile 			" do not use swap file
set number 			" show line numbers
set nowrap 			" do not wrap lines
set backspace=indent,eol,start 	" backspace behaviour
set incsearch 			" search when type search q
set rnu 			" relative line numbers
set laststatus=2
set t_Co=256
set clipboard^=unnamedplus 	" unified with X clipboard
set ignorecase			" case shit for search
set smartcase
set wildmenu            " display a menu for command auto-completion
set shortmess+=c
" }}}

" {{{ Airline and tmuxline
" some airline/tmuxline themes n shiet
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols.maxlinenr = ''
let g:airline_theme = 'dracula'
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'z'    : '#H'}
" }}}

" {{{ Reloading init.vim
if !exists('*ReloadVimrc')
    fun! ReloadVimrc()
        let save_cursor = getcurpos()
        source $MYVIMRC
        call setpos('.', save_cursor)
    endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()
" }}}
