" init.vim => neovim init

if filereadable(expand('~/.config/nvim/config/plug.vim'))
  " import base 
   source ~/.config/nvim/config/plug.vim
   source ~/.config/nvim/config/setting.vim

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
endif
