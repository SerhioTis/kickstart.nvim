vim.cmd 'let g:netrw_liststyle = 3'

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.mouse = 'a'

opt.showmode = false

opt.clipboard = 'unnamedplus'

opt.breakindent = true

opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = 'yes'

opt.updatetime = 250
opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

opt.inccommand = 'split'
opt.cursorline = true

opt.scrolloff = 10

opt.foldmethod = 'expr'
opt.foldcolumn = '1'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 10

opt.wildignore:append { '*/node_modules/*' }

opt.conceallevel = 2

opt.spell = true
opt.spelllang = 'en_us'

opt.inccommand = 'split'
