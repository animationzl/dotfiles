""""""""""""""""
" plugin manager
""""""""""""""""

" tpope/vim-pathogen
""""""""""""""
execute pathogen#infect()
syntax on
filetype plugin indent on

"""""""""""""""""
" native settings
"""""""""""""""""

" basic
"""""""
set nocompatible

set timeoutlen=1000
set ttimeoutlen=0

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
colorscheme onedark

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1
let &termencoding=&encoding

set laststatus=2
set ruler
set showcmd
set cursorline

set nobackup
set noswapfile

set tabstop=4
set autoindent
set shiftwidth=4
set expandtab

set incsearch
set ignorecase
set smartcase
set hlsearch

set foldmethod=indent
set foldlevelstart=99
set scrolloff=999

" key map
"""""""""
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <space> za
nnoremap = <c-w>=

" leader map
""""""""""""
let mapleader = ","

nnoremap <silent> <leader><space> :call <sid>stripTrailingWhitespace()<cr>
function! <sid>stripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" autocmd
"""""""""
" highlight trailing whitespace
highlight TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\s\+$/
autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/

" column guideline
autocmd BufNewFile,BufReadPost *.py set colorcolumn=80

""""""""""""""""
" plugins config
""""""""""""""""

" itchyny/lightline.vim
"""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" scrooloose/nerdtree
"""""""""""""""""""""
map <f1> :NERDTreeToggle<cr>
map <leader>f :NERDTreeFind<cr>

" majutsushi/tagbar
"""""""""""""""""""
nmap <f2> :TagbarToggle<cr>

" fholgado/minibufexpl.vim
""""""""""""""""""""""""""
let g:miniBufExplBuffersNeeded = 1
let g:miniBufExplShowBufNumbers = 0

" mileszs/ack.vim
"""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cnoreabbrev ag Ack!
cnoreabbrev agf AckFile!
vmap * "ay:Ack! '<c-r>a'<cr>

" airblade/vim-rooter
"""""""""""""""""""""
let g:rooter_silent_chdir = 1

" easymotion/vim-easymotion
"""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-sl)
nmap s <Plug>(easymotion-s2)
