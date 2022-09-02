" coc.vim => For coc config

if isdirectory(expand('~/.vim/plugged/coc.nvim'))
  " coc extensions
  let g:coc_global_extensions = [
  \   'coc-css',
  \   'coc-explorer',
  \   'coc-angular',
  \   'coc-html',
  \   'coc-json',
  \   'coc-prettier',
  \   'coc-tsserver',
  \   'coc-vimlsp',
  \   'coc-snippets',
  \   'coc-go',
  \   'coc-git',
  \ ]
  " coc_explorer setting 
  let g:coc_explorer_global_presets = {
  \   '.vim': {
  \     'root-uri': '~/.vim',
  \   },
  \   'cocConfig': {
  \      'root-uri': '~/.config/coc',
  \   },
  \   'tab': {
  \     'position': 'tab',
  \     'quit-on-open': v:true,
  \   },
  \   'floating': {
  \     'position': 'floating',
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingTop': {
  \     'position': 'floating',
  \     'floating-position': 'center-top',
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingLeftside': {
  \     'position': 'floating',
  \     'floating-position': 'left-center',
  \     'floating-width': 50,
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'floatingRightside': {
  \     'position': 'floating',
  \     'floating-position': 'right-center',
  \     'floating-width': 50,
  \     'open-action-strategy': 'sourceWindow',
  \   },
  \   'simplify': {
  \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
  \   },
  \   'buffer': {
  \     'sources': [{'name': 'buffer', 'expand': v:true}]
  \   },
  \}

  " Open coc explorer
  nmap <silent><space>ef :CocCommand explorer --preset floating<CR>
  nmap <silent><space>ee :CocCommand explorer <cr>

  " Fzf symbols Search
  nnoremap <silent><space>f       :<C-u>CocFzfList symbols<CR>

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nnoremap <silent> gh :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction
  
  inoremap <silent><expr> <c-f> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  
  " navigate chunks of current buffer
  nmap <silent> gk <Plug>(coc-git-prevchunk)
  nmap <silent> gj <Plug>(coc-git-nextchunk)
  " show chunk diff at current position
  nmap gs <Plug>(coc-git-chunkinfo)
  inoremap <silent><expr> <c-\> coc#refresh()
endif
