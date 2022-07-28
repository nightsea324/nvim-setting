" plug.vim => For plug

" set dir_path
let s:plug_dir = '~/.vim/plugged'

call plug#begin(s:plug_dir)
  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Theme
  Plug 'chriskempson/base16-vim'

  " Coc
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Commenter
  Plug 'preservim/nerdcommenter'

  " git 
  " Plug 'airblade/vim-gitgutter'
 
  " AutoTag
  Plug 'craigemery/vim-autotag'

  " Startify
  Plug 'mhinz/vim-startify'

  " CssColor
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  " Jsdoc
  Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
  \}

  " Fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
call plug#end()
