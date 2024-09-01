return {
  'akinsho/bufferline.nvim',
  version = '*',
  config = function()
    require('bufferline').setup {}
    vim.keymap.set('n', 'L', ':BufferLineCycleNext<CR>', { desc = 'go to next buffer', silent = true })
    vim.keymap.set('n', 'H', ':BufferLineCyclePrev<CR>', { desc = 'go to prev buffer', silent = true })
  end,
  opt = {
    key = {
      { 'L', '<>:BufferLineCycleNext<CR>', desc = 'go to next buffer', silent = true },
      { 'H', ':BufferLineCyclePrev<CR>' },
    },
  },
}
