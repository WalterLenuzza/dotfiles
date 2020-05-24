" ----------------------------------------------------------------------------
" Configure vim-airline
" ----------------------------------------------------------------------------

" Enable Powerline fonts
let g:airline_powerline_fonts=1

" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Path formatter
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Show filename only in tabline
let g:airline#extensions#tabline#fnamemod = ':t'

" Enable whitespace display
let g:airline#extensions#whitespace#enabled = 1

"let g:airline#extensions#tmuxline#enabled = 0

" ----------------------------------------------------------------------------
" Configure gruvbox
" ----------------------------------------------------------------------------
let g:gruvbox_italic=1

" ----------------------------------------------------------------------------
" Configure NERDtree
" ----------------------------------------------------------------------------

" Show hidden files
let NERDTreeShowHidden=1

" Hide help
let NERDTreeMinimalUI = 1

" Ignore files
let NERDTreeIgnore = ['\.git$']

" Close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif

