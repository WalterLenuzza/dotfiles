" Load Pathogen plugin manager
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Syntax colors
syntax on
colorscheme monokai

" vim-airline
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
let g:airline#extensions#tmuxline#enabled = 0

" Enable mouse support
"set mouse=a

" Python-friendly show ruler at 78 chars (PEP8)
set colorcolumn=78

" Python-friendly auto-indent
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
