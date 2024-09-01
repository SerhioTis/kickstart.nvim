local opt = vim.opt
local o = vim.o
local g = vim.g

g.mapleader = ' '
g.maplocalleader = ' '

g.have_nerd_font = true

o.laststatus = 3
o.winbar = '%m %f'

o.showmode = false

o.clipboard = 'unnamedplus'
o.cursorline = true
o.cursorlineopt = 'number'

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

o.ignorecase = true
o.smartcase = true
o.signcolumn = 'yes'

o.number = true
o.relativenumber = true

-- Core settings
o.mouse = 'a'
o.breakindent = true

o.undofile = true
o.undodir = os.getenv 'HOME' .. '/.vim/undodir'

o.updatetime = 250
o.timeoutlen = 300
o.splitright = true
o.splitbelow = true
o.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
o.inccommand = 'split'
o.scrolloff = 10
o.conceallevel = 2
o.termguicolors = true

-- Folding
o.foldmethod = 'expr'
o.foldcolumn = '1'
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldlevel = 10

-- Spell checking
o.spell = true
o.spelllang = 'en_us'

-- Other settings
vim.cmd 'let g:netrw_liststyle = 3'
opt.wildignore:append { '*/node_modules/*' }
