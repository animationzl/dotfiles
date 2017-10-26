" basic setting                                                                                                                                                                                                                             
set nocompatible                                                                
syntax on                                                                       
                                                                                
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
set colorcolumn=80                                                              
                                                                                
                                                                                
" key map                                                                       
nnoremap <c-h> <c-w>h                                                           
nnoremap <c-j> <c-w>j                                                           
nnoremap <c-k> <c-w>k                                                           
nnoremap <c-l> <c-w>l                                                           
nnoremap <space> za                                                             
nnoremap = <c-w>=                                                               
map gy "+y                                                                      
                                                                                
" leader map                                                                    
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
" highlight trailing whitespace                                                 
highlight TrailingWhitespace ctermbg=red                                        
match TrailingWhitespace /\s\+$/                                                
autocmd BufWinEnter * match TrailingWhitespace /\s\+$/                          
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/                   
autocmd InsertLeave * match TrailingWhitespace /\s\+$/ 
