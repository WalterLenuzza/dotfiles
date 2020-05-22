" Install vim-plug automatically
if empty(glob('$XDG_DATA_HOME/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "$XDG_DATA_HOME"/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('$XDG_DATA_HOME/nvim/plugged')

" Sane defaults
Plug 'https://github.com/tpope/vim-sensible'

" Gruvbox colorscheme
Plug 'https://github.com/morhetz/gruvbox'

" Status bar
Plug 'https://github.com/vim-airline/vim-airline'

" File system explorer
Plug 'https://github.com/scrooloose/nerdtree'

" Git wrapper
Plug 'https://github.com/tpope/vim-fugitive'

" Initialize plugin system
call plug#end()
