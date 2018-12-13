set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/usr/share/vim/vimfiles/autoload/vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

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
Plugin 'ryanoasis/vim-devicons'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" Proper tabs
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" NERDTree
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Vim Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,php'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" Vim Autosave
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Vim Config
set number
set cursorline

" Colorscheme
colorscheme badwolf

" Tagbar 
nmap <F8> :TagbarToggle<CR>
