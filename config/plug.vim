" Plug.vim => for plug

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

  " FZF
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
  Plug 'preservim/nerdcommenter'
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

  " JavaScript
  Plug 'sheerun/vim-polyglot'

  " Ale
  Plug 'dense-analysis/ale'

  " Angular
  Plug 'burnettk/vim-angular'

call plug#end()
