" init.vim => neovim init

" import plug
if filereadable(expand('~/.config/nvim/config/plug.vim'))
   source ~/.config/nvim/config/plug.vim
endif

" import base 
if filereadable(expand('~/.config/nvim/config/setting.vim'))
   source ~/.config/nvim/config/setting.vim
endif

" import coc-vim config
if filereadable(expand('~/.config/nvim/config/coc.vim'))
  source ~/.config/nvim/config/coc.vim
endif

" import js-vim config
if filereadable(expand('~/.config/nvim/config/js.vim'))
  source ~/.config/nvim/config/js.vim
endif

" import startify config
if filereadable(expand('~/.config/nvim/config/startify.vim'))
  source ~/.config/nvim/config/startify.vim
endif
