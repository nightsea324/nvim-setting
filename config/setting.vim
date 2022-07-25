" setting.vim => For base setting

" base 
  set number                    " 設定行號
  set clipboard=unnamed         " 允許使用複製貼上
  set encoding=utf-8
  set cursorline                " 加強顯示鼠標位置(水平)
  set cursorcolumn              " 加強顯示鼠標位置(垂直)
  scriptencoding utf-8
  set mouse=a                   " 啟用滑鼠
" formatting
  set nowrap            " Do not wrap long lines
  set smartindent       " 自動縮排
  set shiftwidth=4      " tab長度
  set expandtab         " Tabs are spaces, not tabs
  set tabstop=4         " 縮排空格數
  set softtabstop=4     " Let backspace delete indent
  set nojoinspaces      " Prevents inserting two spaces after punctuation on a join (J)
  set splitright        " Puts new vsplit windows to the right of the current
  set splitbelow        " Puts new split windows to the bottom of the current

" color-schema
  syntax on
  let base16colorspace=256    
  set termguicolors
  colorscheme base16-bright
  let g:rainbow_active = 1     " 括弧彩虹

" key mapping
  let mapleader =','          " set the key map leader
  let maplocalleader = '_'

" Easier Moving
  map <C-J> <C-W>j<C-W>_
  map <C-K> <C-W>k<C-W>_
  map <C-L> <C-W>l<C-W>_
  map <C-H> <C-W>h<C-W>_

" QuickSave
  nmap <space>w :w <CR>
  nmap <space>q :q <CR>

" 自動補齊括號、引號
  inoremap ( ()<ESC>i
  inoremap [ []<ESC>i
  inoremap { {}<ESC>i
  inoremap ' ''<ESC>i
  inoremap " ""<ESC>i
  inoremap ` ``<ESC>i

" NoHighlight
  nmap <space>/ :noh <CR>

" CssColor
  let g:Hexokinase_ftEnabled = ['css']

" Commenter
  let g:NERDSpaceDelims = 1

