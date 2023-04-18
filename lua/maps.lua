local keymap = vim.keymap

keymap.set('n', 'x', '"_x')
keymap.set('n', '<space>w', ':w<Return>')
keymap.set('n', '<space>q', ':q<Return>')

-- easier move
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- customize
keymap.set('n', '<space>/', ':noh<Return>')

-- copilot
keymap.set('i', '“', '<Plug>(copilot-previous)')
keymap.set('i', '‘', '<Plug>(copilot-next)')
keymap.set('i', '«', '<Plug>(copilot-suggest)')
