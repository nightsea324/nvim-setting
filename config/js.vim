" js.vim => For JavaScript setting

if isdirectory(expand('~/.vim/plugged/ale'))
" autocomplete
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

endif
