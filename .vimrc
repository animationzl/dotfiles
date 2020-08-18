""""""""""""""""
" Plugin manager
""""""""""""""""

" tpope/vim-pathogen
""""""""""""""""""""
execute pathogen#infect()
syntax on
filetype plugin indent on


"""""""""""""""""
" Native settings
"""""""""""""""""

" Basic
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
set number
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

" GUI
set guifont=Monaco:h14
set guioptions-=r
set guioptions-=L
set guioptions-=b

" Key map
"""""""""
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l
nmap <space> za
nmap = <c-w>=

let mapleader = ","

nmap <leader><space> :call <sid>stripTrailingWhitespace()<cr>
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

" Autocmd
"""""""""
" Highlight trailing whitespace
highlight TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\s\+$/
autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/

" Autosave
autocmd BufLeave,FocusLost * silent! wall


""""""""""""""""
" Plugins config
""""""""""""""""

" itchyny/lightline.vim
"""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ }
      \ }

" scrooloose/nerdtree
"""""""""""""""""""""
nmap <f1> :NERDTreeToggle<cr>

" troydm/easybuffer.vim
"""""""""""""""""""""""""
nmap <f2> :EasyBuffer<cr>

" easymotion/vim-easymotion
"""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-sl)
nmap s <Plug>(easymotion-s2)
vmap f <Plug>(easymotion-sl)
vmap s <Plug>(easymotion-s2)

" junegunn/vim-easy-align
"""""""""""""""""""""""""
vmap <cr> <Plug>(EasyAlign)
