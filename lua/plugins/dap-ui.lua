return {
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  config = function()
    local dap, dapui = require 'dap', require 'dapui'

    -- Enhanced DAP UI setup with flexible layouts
    dapui.setup {
      layouts = {
        -- Left sidebar: Variables and Watches
        {
          elements = {
            { id = 'scopes', size = 0.75 }, -- Variables (main focus)
            { id = 'watches', size = 0.25 }, -- Watch expressions
          },
          size = 0.25, -- Fixed width of 50 columns
          position = 'left',
        },
        -- Right sidebar: Stack and Breakpoints
        {
          elements = {
            { id = 'stacks', size = 0.75 }, -- Call stack (main focus)
            { id = 'breakpoints', size = 0.25 }, -- Breakpoints
          },
          size = 0.25, -- Fixed width of 50 columns
          position = 'right',
        },
        -- Bottom panel for REPL
        {
          elements = {
            { id = 'repl', size = 1.0 },
          },
          size = 0.25,
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

    -- Jump to current stopped location (where the debug pointer is)
    map('n', '<leader>dj', function()
      local session = dap.session()
      if session then
        local frame = session.current_frame
        if frame and frame.source and frame.source.path then
          vim.cmd('edit ' .. vim.fn.fnameescape(frame.source.path))
          vim.api.nvim_win_set_cursor(0, { frame.line, frame.column - 1 })
          vim.cmd 'normal! zz' -- Center the line
        else
          vim.notify('No current frame available', vim.log.levels.WARN)
        end
      else
        vim.notify('No active debug session', vim.log.levels.WARN)
      end
    end, { desc = 'Jump to current breakpoint/stopped location' })

    -- Helper function to focus a specific DAP UI element
    local function focus_element(element_name)
      return function()
        local windows = require 'dapui.windows'
        for _, win in pairs(windows.layouts) do
          for _, buf in pairs(win.buffers()) do
            if buf.element == element_name then
              vim.api.nvim_set_current_win(buf.win())
              return
            end
          end
        end
        vim.notify('DAP UI element "' .. element_name .. '" not found', vim.log.levels.WARN)
      end
    end

    -- Quick focus keybindings (lowercase = focus, uppercase = float)
    map('n', '<leader>dv', focus_element 'scopes', { desc = 'Focus Variables' })
    map('n', '<leader>dk', focus_element 'stacks', { desc = 'Focus Stack' })
    map('n', '<leader>dw', focus_element 'watches', { desc = 'Focus Watches' })
    map('n', '<leader>dB', focus_element 'breakpoints', { desc = 'Focus Breakpoints' })
    map('n', '<leader>dr', focus_element 'repl', { desc = 'Focus REPL' })

    -- Float elements in popup windows
    map('n', '<leader>dV', function()
      dapui.float_element('scopes', { enter = true })
    end, { desc = 'Float Variables' })
    map('n', '<leader>dK', function()
      dapui.float_element('stacks', { enter = true })
    end, { desc = 'Float Stack' })
    map('n', '<leader>dW', function()
      dapui.float_element('watches', { enter = true })
    end, { desc = 'Float Watches' })
    map('n', '<leader>dR', function()
      dapui.float_element('repl', { enter = true })
    end, { desc = 'Float REPL' })
  end,
}
