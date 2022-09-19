local status, nvim_tree = pcall(require, 'nvim-tree')
if (not status) then return end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set('n', '<space>ef', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
vim.keymap.set('n', '<Esc>', ':NvimTreeClose<CR>', { silent = true, noremap = true })

nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    signcolumn = "yes",
    adaptive_size = false,
    mappings = {
      list = {
        { key = "<BS>", action = "dir_up" },
        { key = "<CR>", action = "cd" },
        { key = "l", action = "edit" },
        { key = "h", action = "close_node" },
        { key = "H", action = "collapse_all" },
        { key = "v", action = "vsplit" },
        { key = "s", action = "split" },
        { key = "gh", action = "toggle_file_info" },
      },
    },
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        border = "shadow",
        width = math.floor(vim.fn.winwidth(0) / 2),
        height = math.floor(vim.fn.winheight(0) / 5 * 3),
        row = math.floor(vim.fn.winheight(0) / 5),
        col = math.floor(vim.fn.winwidth(0) / 4),
      },
    },

  },
  renderer = {
    group_empty = true,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    special_files = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "rounded",
        style = "minimal",
      },
    },
  },
})
