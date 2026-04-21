local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ─── General ─────────────────────────────────────────────────────────────────
keymap.set('n', 'x', '"_x', opts)                   -- black hole delete
keymap.set('n', '<space>w', ':w<Return>', opts)      -- save
keymap.set('n', '<space>q', ':q<Return>', opts)      -- quit
keymap.set('n', '<space>/', ':noh<Return>', opts)    -- clear search highlight

-- ─── Split navigation ────────────────────────────────────────────────────────
keymap.set('n', '<C-h>', '<C-w>h', opts)
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)

-- gt / gT → tab switching (vim built-in, no mapping needed)
