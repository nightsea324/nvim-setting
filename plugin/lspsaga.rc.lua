local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  },
  -- float transparent
  saga_winblend = 0,
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "single",
  code_action_icon = "",
  code_action_num_shortcut = false,
  code_action_lightbulb = {
    enable = false,
    enable_in_insert = false,
    cache_code_action = false,
    sign = false,
  },
  finder_action_keys = {
    open = { "o", "<Return>" },
    vsplit = "v",
    split = "s",
    tabe = "t",
    quit = { "q", "<Esc>" },
  },
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<F3>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<F4>', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('n', '', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', '<F2>', '<Cmd>Lspsaga rename<CR>', opts)
