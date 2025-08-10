" options
"""""""""

" eliminate keyboard delay
set timeoutlen=500
set ttimeoutlen=0

" no backup & swap file
set nobackup
set noswapfile

" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1
let &termencoding=&encoding

" indent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" search
set incsearch
set ignorecase
set smartcase
set hlsearch
set shortmess-=S " show search count message when searching

" fold
set foldmethod=indent
set foldlevelstart=99

" appearance
set laststatus=2
set number
set ruler
set showcmd
set cursorline
set noshowmode
set scrolloff=99 " make cursor line always be in the middle of the window
set splitbelow " focus on the new window when split
set splitright " focus on the new window when split
let &fillchars ..= ',eob: ' " disable `~` on nonexistent lines

" others
set clipboard=unnamed " change default register to system clipboard
set vb t_vb= " no beep or flash

" plugins
"""""""""

" automatic install plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" manage plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'vim-scripts/VimCompletesMe'
Plug 'cohama/lexima.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
call plug#end()

" Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

nmap f <Plug>(easymotion-sl)
nmap s <Plug>(easymotion-s2)
vmap f <Plug>(easymotion-sl)
vmap s <Plug>(easymotion-s2)

" Plug 'junegunn/vim-easy-align'
vmap <cr> <Plug>(EasyAlign)

" colorscheme
"""""""""""""

set termguicolors
set rtp+=~/code/github.com/folke/tokyonight.nvim/extras/vim
colorscheme tokyonight
hi cursorline cterm=NONE gui=NONE
hi cursorlinenr cterm=NONE gui=NONE

" autocmd
"""""""""

" highlight trailing whitespace
highlight TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\s\+$/
autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/
