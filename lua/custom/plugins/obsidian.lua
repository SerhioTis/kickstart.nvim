return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
    'pomo.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'Obdidian Vault',
        path = '~/Documents/',
      },
      {
        name = 'Obsidian Sandbox',
        path = '~/Library/Application Support/obsidian',
      },
    },
    templates = {
      folder = 'Templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      tags = '',
      substitutions = {
        yesterday = function()
          return os.date('%Y-%m-%d', os.time() - 86400)
        end,
        tomorrow = function()
          return os.date('%Y-%m-%d', os.time() + 86400)
        end,
      },
    },
  },
}
