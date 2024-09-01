return {
  'mfussenegger/nvim-dap',
  event = 'VeryLazy',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    {
      'jay-babu/mason-nvim-dap.nvim',
      opt = {
        handlers = {},
        ensure_installed = {
          'delve',
          'js-debug-adapter',
          'codelldb',
          'debugpy',
        },
      },
    },
    {
      'mfussenegger/nvim-dap-python',
      ft = 'python',
      config = function()
        require('dap-python').setup 'python3'
      end,
    },
    {
      'leoluz/nvim-dap-go',
      ft = 'go',
      opts = {},
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<leader>dsi', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<leader>dso', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<leader>dsu', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.adapters['pwa-node'] = {
      type = 'server',
      host = '127.0.0.1',
      port = 8123,
      executable = {
        command = 'js-debug-adapter',
      },
    }

    for _, language in ipairs { 'typescript', 'javascript' } do
      dap.configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
          runtimeExecutable = 'node',
        },
      }
    end
  end,
}
