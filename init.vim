if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('w0rp/ale')
  call dein#add('mxw/vim-jsx')
  call dein#add('kern/vim-es7')
  call dein#add('posva/vim-vue')
  call dein#add('elzr/vim-json')
  call dein#add('morhetz/gruvbox')
  call dein#add('ap/vim-css-color')
  call dein#add('junegunn/fzf.vim')
  call dein#add('majutsushi/tagbar')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('neoclide/coc.nvim', {'rev': 'release'})
  call dein#add('cohama/lexima.vim')
  call dein#add('alvan/vim-closetag')
  call dein#add('tpope/vim-surround')
  call dein#add('honza/vim-snippets')
  call dein#add('scrooloose/nerdtree')
  call dein#add('907th/vim-auto-save')
  call dein#add('Yggdroot/indentLine')
  call dein#add('jwalton512/vim-blade')
  call dein#add('tpope/vim-commentary')
  call dein#add('itchyny/lightline.vim')
  call dein#add('maximbaz/lightline-ale')
  call dein#add('pangloss/vim-javascript')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('captbaritone/better-indent-support-for-php-with-html')
  call dein#add('ryanoasis/vim-devicons')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Color scheme
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

" Tagbar settings
" I want sorting to be in the way that they are ordered in the file as opposed to 
" the default alphabetical sorting
let g:tagbar_sort = 0

" Custom keybindings
map <F4> 1gt <bar> :tabonly <bar> :bufdo bd <bar> :NERDTree<CR>
map <F7> :ALEFix <CR>
map <F5> :NERDTree <CR>
nmap <F8> :TagbarToggle<CR>
map <F6> :!ctags -R & <CR>
