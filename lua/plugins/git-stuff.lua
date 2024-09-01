return {
  'ThePrimeagen/git-worktree.nvim',
  'tpope/vim-fugitive',

  {
    'pwntester/octo.nvim',
    opts = {
      enable_builtin = false,
    },
    keys = {
      { '<leader>O', '<cmd>Octo<cr>', desc = 'Octo' },
    },
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'sindrets/diffview.nvim',
    },
    opts = {},
  },
  {
    'lewis6991/gitsigns.nvim',

    opts = {
      current_line_blame = true,
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}
