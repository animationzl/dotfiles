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
set scrolloff=8 " number of lines to keep above and below the cursor
set splitbelow " focus on the new window when split
set splitright " focus on the new window when split
let &fillchars ..= ',eob: ' " disable `~` on nonexistent lines

" others
set clipboard=unnamed " change default register to system clipboard
set vb t_vb= " no beep or flash

" key maps
""""""""""

let mapleader = " "

" quick save & quit
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>

" switch window
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

" split window
nmap \ :split<cr>
nmap \| :vsplit<cr>

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
Plug 'vim-scripts/VimCompletesMe'
Plug 'cohama/lexima.vim'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree'
Plug 'troydm/easybuffer.vim'
call plug#end()

" onedark.vim
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

syntax on
colorscheme onedark

" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" nerdtree
nmap <leader>e :NERDTreeToggle<cr>
nmap <leader>f :NERDTreeFind<cr>
" https://github.com/preservim/nerdtree/issues/1321
" after using <m> bottom panel stays bigger and wont disappear
" workaround
let g:NERDTreeMinimalMenu=1

" easybuffer.vim
nmap <leader>b :EasyBuffer<cr>

" vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-sl)
nmap s <Plug>(easymotion-s2)
vmap f <Plug>(easymotion-sl)
vmap s <Plug>(easymotion-s2)

" vim-easy-align
vmap <cr> <Plug>(EasyAlign)
