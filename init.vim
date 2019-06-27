set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'w0rp/ale'
Plugin 'mxw/vim-jsx'
Plugin 'dracula/vim'
Plugin 'kern/vim-es7'
Plugin 'posva/vim-vue'
Plugin 'elzr/vim-json'
Plugin 'morhetz/gruvbox'
Plugin 'arzg/vim-wizard'
Plugin 'ap/vim-css-color'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'cohama/lexima.vim'
" Plugin 'SirVer/ultisnips'
Plugin 'alvan/vim-closetag'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin '907th/vim-auto-save'
Plugin 'Yggdroot/indentLine'
Plugin 'jwalton512/vim-blade'
Plugin 'tpope/vim-commentary'
" Plugin 'ajh17/VimCompletesMe'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
" Plugin 'lifepillar/vim-mucomplete'
" Plugin 'skywind3000/gutentags_plus'
" Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'captbaritone/better-indent-support-for-php-with-html'
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

" Cplor scheme
colorscheme gruvbox

" Vim config
filetype plugin on
filetype plugin indent on
set termguicolors
set number
set cursorline
set wildmode=longest,list
set ignorecase  
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
" set omnifunc=syntaxcomplete#Complete
setlocal spell spelllang=en_us
let g:ruby_host_prog = "/usr/bin/ruby"

" Auto close brackets
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
"inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

" NERDTree config
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeShowHidden=1

" FZF
map <C-p> :Files <CR>

" Autosave utilities
autocmd InsertLeave * update
let g:auto_save = 1  " enable AutoSave on Vim startup

" Global fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
" let g:ale_fix_on_save = 1

" ALE and Lightline integration
" let g:lightline = {}

" let g:lightline.component_expand = {
"      \  'linter_checking': 'lightline#ale#checking',
"      \  'linter_warnings': 'lightline#ale#warnings',
"      \  'linter_errors': 'lightline#ale#errors',
"      \  'linter_ok': 'lightline#ale#ok',
"      \ }
"let g:lightline.component_type = {
"      \     'linter_checking': 'left',
"      \     'linter_warnings': 'warning',
"      \     'linter_errors': 'error',
"      \     'linter_ok': 'left',
"      \ }
"let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

" Vim Closetag config
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.php,*.ejs,*.html.erb,*.vue'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.ejs,*.vue'
let g:closetag_filetypes = 'html,xhtml,phtml,php,jsx,js,ejs,vue'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,ejs,vue'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" COC
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Custom keybindings
map <F4> 1gt <bar> :tabonly <bar> :bufdo bd <bar> :NERDTree<CR>
map <F7> :ALEFix <CR>
map <F5> :NERDTree <CR>
nmap <F8> :TagbarToggle<CR>
map <F6> :!ctags -R & <CR>
