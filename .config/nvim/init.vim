set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

call vundle#end()

filetype plugin indent on

colorscheme base16-tomorrow-night
syntax on

" python lsp setup
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

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
set clipboard=unnamedplus 	" unified with X clipboard
set ignorecase			" case shit for search
set smartcase
set wildmenu            " display a menu for command auto-completion

" some airline/tmuxline themes n shiet
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols.maxlinenr = ''
let g:airline_theme = 'base16_tomorrow'
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'z'    : '#H'}
