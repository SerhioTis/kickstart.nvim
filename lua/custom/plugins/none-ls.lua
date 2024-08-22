return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    {
      'rust-lang/rust.vim',
      ft = 'rust',
      init = function()
        vim.g.rustfmt_autosave = 1
      end,
    },
  },
  config = function()
    local null_ls = require 'null-ls'
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    null_ls.setup {
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds {
            group = augroup,
            buffer = bufnr,
          }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false, debug = true }
            end,
          })
        end
      end,
      sources = {
        null_ls.builtins.formatting.stylua,

        null_ls.builtins.diagnostics.mypy,
        require 'none-ls.diagnostics.ruff',
        null_ls.builtins.formatting.black,

        null_ls.builtins.formatting.prettierd,
        require 'none-ls.diagnostics.eslint_d',

        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.golines,
        -- null_ls.builtins.code_actions.gomodifytags,
        -- null_ls.builtins.code_actions.impl,
        -- null_ls.builtins.diagnostics.golangci_lint,

        null_ls.builtins.formatting.clang_format,
      },
    }

    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = '[F]ormat buffer' })
  end,
}
