filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'valloric/youcompleteme'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'alvan/vim-closetag'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'sjl/badwolf'
Plugin 'Yggdroot/indentLine'
Plugin '907th/vim-auto-save'
Plugin 'luochen1990/rainbow'
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on  " allows auto-indenting depending on file type

" General Settings
syntax on
set guicursor=

set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=200                  " set an 80 column border for good coding style
set invspell

" NERDTree
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Vim Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Colorscheme
colorscheme badwolf

" Tagbar 
nmap <F8> :TagbarToggle<CR>