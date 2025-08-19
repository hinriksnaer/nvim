return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      {
        name = 'workspace',
        path = '~/Documents/notes',
      },
    },
  },
  keys = {
    { '<leader>nn', '<cmd>ObsidianNew<CR>', desc = 'Obsidian: New Note' },
    { '<leader>ns', '<cmd>ObsidianSearch<CR>', desc = 'Obsidian: Search Notes' },
    { '<leader>nw', '<cmd>ObsidianQuickSwitch<CR>', desc = 'Obsidian: Quick Switch' },
    { '<leader>nb', '<cmd>ObsidianBacklinks<CR>', desc = 'Obsidian: Backlinks' },
    { '<leader>nt', '<cmd>ObsidianTemplate<CR>', desc = 'Obsidian: Insert Template' },
    { '<leader>np', '<cmd>ObsidianPasteImg<CR>', desc = 'Obsidian: Paste Image' },
    -- optional advanced navigations if supported by your version:
    { '<leader>nf', '<cmd>ObsidianFollowLink<CR>', desc = 'Obsidian: Follow Link' },
  },
  config = function()
    require('obsidian').setup {
      workspaces = {
        Notes = vim.fn.expand '~/Documents/notes', -- adjust to your vault location
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      new_notes_location = 'current_dir',
      mappings = {
        ['<leader>of'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>od'] = {
          action = function()
            return require('obsidian').util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
    }
  end,
}
