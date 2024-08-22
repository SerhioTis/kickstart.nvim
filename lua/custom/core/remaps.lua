vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

local keymap = vim.keymap

--  See `:help vim.keymap.set()`

vim.opt.hlsearch = true
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- save file with ctrl-s
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:write<CR>', { noremap = true, silent = true })

-- increment or decrement numbers
keymap.set('n', '<leader>+', '<C-a>', { desc = 'increment number' })
keymap.set('n', '<leader>-', '<C-a>', { desc = 'decrement number' })

-- spliting windows
keymap.set('n', '<leader>ss', ':vsplit<CR>', { desc = 'split window vertically' })
keymap.set('n', '<leader>sh', ':split<CR>', { desc = 'split window horizontally' })
keymap.set('n', '<leader>sv', '<C-w>=', { desc = 'make windows equal size' })
keymap.set('n', '<leader>sl', '<cmd>close<CR>', { desc = 'close current split' })

-- tab management
keymap.set('n', '<leader>tt', '<cmd>tabnew<CR>', { desc = 'open new tab' })
keymap.set('n', '<leader>tl', '<cmd>tabclose<CR>', { desc = 'close current tab' })
-- keymap.set('n', 'L', '<cmd>tabn<CR>', { desc = 'go to next tab' })
-- keymap.set('n', 'H', '<cmd>tabp<CR>', { desc = 'go to prev tab' })
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'open current buffer in new tab' })

keymap.set('i', 'jk', '<ESC>')

keymap.set('n', '<C-a>', 'ggVG')

vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
