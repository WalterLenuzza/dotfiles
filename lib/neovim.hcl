file.directory "config" {
  destination = "{{param `prefix`}}/.config/nvim"
  create_all  = true
}

file.directory "filetype" {
  destination = "{{param `prefix`}}/.config/nvim/ftplugin"
  create_all  = true
}

file.directory "autoload" {
  destination = "{{param `prefix`}}/.local/share/nvim/site/autoload"
  create_all  = true
}

file.directory "colorscheme" {
  destination = "{{param `prefix`}}/.local/share/nvim/bundle/colors"
  create_all  = true
}

file.fetch "pathogen" {
  depends     = ["file.directory.autoload"]
  source      = "https://tpo.pe/pathogen.vim"
  destination = "{{param `prefix`}}/.local/share/nvim/site/autoload/pathogen.vim"
  hash_type   = "sha256"
  hash        = "72a3f5db89ab36a207ea1a613a2afacd072ffd0f75da63fb74f0010f841d44b3"
}

file.content "python" {
  depends     = ["file.directory.filetype"]
  destination = "{{param `prefix`}}/.config/nvim/ftplugin/python.vim"

  content = <<EOF
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal foldmethod=indent
compiler python
EOF
}

file.content "yaml" {
  depends     = ["file.directory.filetype"]
  destination = "{{param `prefix`}}/.config/nvim/ftplugin/yaml.vim"

  content = <<EOF
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal foldmethod=indent
EOF
}

file.content "config" {
  depends     = ["file.directory.config"]
  destination = "{{param `prefix`}}/.config/nvim/init.vim"

  content = <<EOF
""" NeoVim config """

" Enforce not vi-compatible mode even though
" when Vim finds a vimrc, 'nocompatible' is set anyway
set nocompatible

" Manage plugins Pathogen (https://github.com/tpope/vim-pathogen)
execute pathogen#infect('bundle/{}', '{{param `prefix`}}/nvim/bundle/{}')

" Load filtype plugins according to detected filetype
if has('autocmd')
  filetype plugin indent on
endif

""" Editing """

" Indent according to previous line
set autoindent

" Use spaces instead of tabs
set expandtab

" Tab key indents by 4 spaces
set softtabstop=4

" >> indents by 2 spaces.
set shiftwidth=2

" >> indents to next multiple of 'shiftwidth'
set shiftround

" Cursor keys in insert mode
set esckeys

" Make backspace work as you would expect
set backspace=indent,eol,start

" Switch between buffers without having to save first
set hidden

""" Search """

" Highlight while searching with / or ?
set incsearch

" Keep matches highlighted
set hlsearch

" Open new windows below the current window
set splitbelow

" Open new windows right of the current window
set splitright

" Find the current line quickly
set cursorline

" Searches wrap around end-of-file
set wrapscan

" Always report changed lines
set report=0

" Only highlight the first 200 columns
set synmaxcol=200

""" Visual """

" Disable bells
set noerrorbells

" Faster redrawing
set ttyfast

" Only redraw when necessary
set lazyredraw

" Enable syntax highlighting
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Show line numbers
set nu

" Set line-spacing to minimum
set linespace=0

" Always show statusline
set laststatus=2

" Show rules
set ruler

" Show as much as possible of the last line
set display=lastline

" Show current mode in command-line
set showmode

" Show matching brackets
set showmatch

" Show already typed keys when more are expected
set showcmd

" Disable code folding
set nofoldenable

""" Colors """

" Enable TrueColor
"set termguicolors

" Make the background dark
set background=dark

" Set color scheme
colorscheme gruvbox

""" Directory browser """

let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

""" Plugins: Airline """

" Automatically display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Enable whitespace display
let g:airline#extensions#whitespace#enabled = 1

" Enable Powerline symbols
let g:airline_powerline_fonts = 1
EOF
}
