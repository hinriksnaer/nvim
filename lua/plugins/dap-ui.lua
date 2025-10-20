return {
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  config = function()
    local dap, dapui = require 'dap', require 'dapui'

    -- Conventional DAP UI setup with default layouts
    dapui.setup {
      layouts = {
        {
          elements = {
            { id = 'scopes', size = 0.25 },
            { id = 'breakpoints', size = 0.25 },
            { id = 'stacks', size = 0.25 },
            { id = 'watches', size = 0.25 },
          },
          size = 40,
          position = 'right',
        },
        {
          elements = {
            { id = 'repl', size = 0.5 },
            { id = 'console', size = 0.5 },
          },
          size = 20,
          position = 'bottom',
        },
      },
      controls = {
        enabled = true,
        element = 'repl',
      },
      floating = { border = 'rounded', mappings = { close = { 'q', '<Esc>' } } },
      expand_lines = true,
    }

    -- Automatically open/close DAP UI
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    -- Keymaps
    local map = vim.keymap.set
    map('n', '<leader>dx', dapui.toggle, { desc = 'Toggle DAP UI' })
    map('n', '<leader>de', dapui.eval, { desc = 'Evaluate Expression' })
    map('v', '<leader>de', dapui.eval, { desc = 'Evaluate Selection' })
    map('n', '<leader>dh', function()
      require('dap.ui.widgets').hover()
    end, { desc = 'Widgets' })
  end,
}
