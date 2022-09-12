local status, blankline = pcall(require, "indent_blankline")
if (not status) then return end

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar1 guibg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar2 guibg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar3 guibg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar4 guibg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar5 guibg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar6 guibg=#C678DD gui=nocombine]]

vim.g.indent_blankline_show_current_context = true

blankline.setup {
  context_char = " ",
  char_highlight_list = {
    "indentblanklineindent1",
    "indentblanklineindent2",
    "indentblanklineindent3",
    "indentblanklineindent4",
    "indentblanklineindent5",
    "indentblanklineindent6",
  },
  context_highlight_list = {
    "IndentBlanklineContextChar1",
    "IndentBlanklineContextChar2",
    "IndentBlanklineContextChar3",
    "IndentBlanklineContextChar4",
    "IndentBlanklineContextChar5",
    "IndentBlanklineContextChar6",
  },
  show_trailing_blankline_indent = false,
  show_current_context = true,
}
