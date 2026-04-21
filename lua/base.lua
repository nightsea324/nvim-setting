-- Disable netrw early (nvim-tree replaces it)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.shell = 'fish'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.clipboard:append({ 'unnamedplus' })
vim.opt.mouse = 'a'
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append({ '**' })
vim.opt.wildignore:append({ '*/node_modules/*' })
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = 'yes:1'
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.formatoptions:append({ 'r' })

vim.cmd('autocmd VimEnter * :clearjumps')

-- Transparent background — use terminal (Ghostty) colors
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    local groups = {
      'Normal', 'NormalNC', 'NormalFloat', 'SignColumn',
      'EndOfBuffer', 'LineNr', 'CursorLineNr', 'Pmenu',
    }
    for _, g in ipairs(groups) do
      local hl = vim.api.nvim_get_hl(0, { name = g })
      hl.bg = nil
      hl.ctermbg = nil
      vim.api.nvim_set_hl(0, g, hl)
    end
  end,
})
vim.cmd('colorscheme default')
