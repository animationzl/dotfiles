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
set guifont=Monaco:h12
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
nmap <f4> :set paste!<cr>

" Leader map
""""""""""""
let mapleader = ","

" Format json string and change unicode escape sequence to single character inplace
" :s/         - start a search/replace command in the selected line block
" \\u         - Search for the characters \u
" \(...\)     - remember the next chars
" \x\{4\}     - 4 hexadecimal characters - they will be remembered and be available as submatch(1)
" /           - replace each match by
" \=          - evaluate the following to an expression
" nr2char(    - return the character for the number given
" '0x'        - put a '0x' in front of the number to force hexadecimal value
" .           - append
" submatch(1) - the hexadecimal number remembered above
" )           - closing paren of nr2char()
" /g          - replace for every occurrence in each line
vmap <leader>j :!python3 -m json.tool<cr>vi{:s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/g<cr>

nmap <silent> <leader><space> :call <sid>stripTrailingWhitespace()<cr>
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
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" scrooloose/nerdtree
"""""""""""""""""""""
nmap <f1> :NERDTreeToggle<cr>
nmap <leader>f :NERDTreeFind<cr>

" majutsushi/tagbar
"""""""""""""""""""
nmap <f3> :TagbarToggle<cr>

" mileszs/ack.vim
"""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

cabbrev ag Ack!
cabbrev agf AckFile!
vmap * "ay:Ack! '<c-r>a'<cr>

" airblade/vim-rooter
"""""""""""""""""""""
let g:rooter_silent_chdir = 1
let g:rooter_change_directory_for_non_project_files = 'current'

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

" troydm/easybuffer.vim
"""""""""""""""""""""""
nmap <f2> :EasyBuffer<cr>
