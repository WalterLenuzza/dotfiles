""" NeoVim config """
set nocompatible

" ----------------------------------------------------------------------------
" Load plugins
" ----------------------------------------------------------------------------
source $XDG_CONFIG_HOME/nvim/plugin-manager.vim

" ----------------------------------------------------------------------------
" Configure plugins
" ----------------------------------------------------------------------------
source $XDG_CONFIG_HOME/nvim/plugins.vim

" ----------------------------------------------------------------------------
" Load functions
" ----------------------------------------------------------------------------
source $XDG_CONFIG_HOME/nvim/functions.vim

" ----------------------------------------------------------------------------
" Configure keyboard shotcuts
" ----------------------------------------------------------------------------
source $XDG_CONFIG_HOME/nvim/shortcuts.vim

" ----------------------------------------------------------------------------
" Base config
" ----------------------------------------------------------------------------

" Enable TrueColor
set termguicolors

" Colorscheme
colorscheme gruvbox

" Buffers become hidden when abandoned
set hidden

" Tab character settings
set linebreak
set scrolloff=3
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Line numbers
" Automatic toggling between line number modes
" https://jeffkreeftmeijer.com/vim-number
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Clipboard
" https://stackoverflow.com/questions/2514445/turning-off-auto-indent-when-pasting-text-into-vim/38258720#38258720
set clipboard=unnamed

" set fillchars+=stl:\ ,stlnc:\

"set wildchar=<Tab> wildmenu wildmode=full
