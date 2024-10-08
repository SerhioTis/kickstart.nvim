return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'cpp',
      'rust',
      'python',
      'sql',

      'lua',
      'luadoc',
      'vim',
      'vimdoc',
      'markdown',
      'markdown_inline',
      'regex',

      'html',
      'css',
      'javascript',
      'typescript',
      'tsx',
      'jsdoc',
      'json',
      'yaml',
      'graphql',

      'go',
      'gomod',
      'gosum',
      'gotmpl',
      'gowork',

      'dockerfile',
      'gitignore',

      'yaml',
      'toml',
      'nix',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function(_, opts)
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup(opts)

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
