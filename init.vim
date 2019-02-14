filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'
" Plugin '/usr/share/fzf/'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'valloric/youcompleteme'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'alvan/vim-closetag'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'romainl/Apprentice'
Plugin 'sjl/badwolf'
Plugin 'ayu-theme/ayu-vim'
Plugin 'Yggdroot/indentLine'
Plugin '907th/vim-auto-save'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'luochen1990/rainbow'
Plugin 'whatyouhide/vim-gotham'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ap/vim-css-color'
Plugin 'shmargum/vim-sass-colors'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'ryanoasis/vim-devicons'
Plugin 'captbaritone/better-indent-support-for-php-with-html'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on  " allows auto-indenting depending on file type

" Ayu colorscheme config
set termguicolors
let ayucolor="mirage"

" Omnicompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" General Settings
syntax on
set guicursor=
set cursorline
colorscheme gruvbox
nmap <F5> :tabnew<CR>

set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=a                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
" set expandtab             " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=200                  " set an 80 column border for good coding style
set invspell
:set list lcs=tab:\|\       " Make Indentline plugin compatible with tab-indented lines

" NERDTree
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Vim Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.php'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,php,jsx,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" Vim Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Tagbar 
nmap <F8> :TagbarToggle<CR>

" Vim ALE
" let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace']
\}
nmap <F7> :ALEFix<CR>

" FZF
nmap <F6> :Files<CR>
