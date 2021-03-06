" startify.vim => For startify config

if isdirectory(expand('~/.vim/plugged/vim-startify'))
  " header
  let g:startify_custom_header = [
              \'  ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗███████╗███████╗ █████╗ ',
              \'  ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗███████╗███████╗ █████╗ ',
              \'  ████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝██╔════╝██╔════╝██╔══██╗',
              \'  ██╔██╗ ██║██║██║  ███╗███████║   ██║   ███████╗█████╗  ███████║',
              \'  ██║╚██╗██║██║██║   ██║██╔══██║   ██║   ╚════██║██╔══╝  ██╔══██║',
              \'  ██║ ╚████║██║╚██████╔╝██║  ██║   ██║   ███████║███████╗██║  ██║',
              \'  ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝',
              \ ]
  " footer
  let g:startify_custom_footer = [
              \'  ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗███████╗███████╗ █████╗ ',
              \'  ███╗   ██╗██╗ ██████╗ ██╗  ██╗████████╗███████╗███████╗ █████╗ ',
              \'  ████╗  ██║██║██╔════╝ ██║  ██║╚══██╔══╝██╔════╝██╔════╝██╔══██╗',
              \'  ██╔██╗ ██║██║██║  ███╗███████║   ██║   ███████╗█████╗  ███████║',
              \'  ██║╚██╗██║██║██║   ██║██╔══██║   ██║   ╚════██║██╔══╝  ██╔══██║',
              \'  ██║ ╚████║██║╚██████╔╝██║  ██║   ██║   ███████║███████╗██║  ██║',
              \'  ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝╚═╝  ╚═╝',
              \ ]
  " list
  let g:startify_lists = [
              \ { 'type': 'dir',       'header': ['   Menu '. getcwd()] },
              \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
              \ ]
  " bookmarks
  let g:startify_bookmarks = [ {'c': '~/.config'}, {'z':'~/.zshrc'} ]
  " list number
  let g:startify_files_number = 20
endif
