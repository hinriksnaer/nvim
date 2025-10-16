return {
  'mrjones2014/smart-splits.nvim',
  event = 'VeryLazy',
  opts = {
    -- Ignored buffer types (only while resizing)
    ignored_buftypes = { 'nofile', 'quickfix', 'prompt' },
    -- Ignored filetypes (only while resizing)
    ignored_filetypes = { 'NvimTree' },
    -- Resize amount (3 is faster than default 2)
    default_amount = 3,
    -- Wrap to opposite side when at edge (or 'split' to create new split)
    at_edge = 'wrap',
    -- Enable tmux integration
    -- This allows seamless navigation between vim and tmux
    multiplexer_integration = 'tmux',
  },
  config = function(_, opts)
    require('smart-splits').setup(opts)

    -- Navigation that works seamlessly with tmux
    -- These replace the existing Ctrl+hjkl mappings
    vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left, { desc = 'Move to left window' })
    vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down, { desc = 'Move to lower window' })
    vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up, { desc = 'Move to upper window' })
    vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right, { desc = 'Move to right window' })

    -- Smarter resizing (also respects tmux)
    vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left, { desc = 'Resize window left' })
    vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down, { desc = 'Resize window down' })
    vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up, { desc = 'Resize window up' })
    vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right, { desc = 'Resize window right' })

    -- Window management under <leader>w
    vim.keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'Next window' })
    vim.keymap.set('n', '<leader>wc', '<C-w>c', { desc = 'Close window' })
    vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Close other windows' })
    vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split vertically' })
    vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Split horizontally' })
    vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Equal window sizes' })
    vim.keymap.set('n', '<leader>wm', '<C-w>_<C-w>|', { desc = 'Maximize window' })

    -- Swap windows (move buffer to different window)
    vim.keymap.set('n', '<leader>wh', require('smart-splits').swap_buf_left, { desc = 'Swap with left' })
    vim.keymap.set('n', '<leader>wj', require('smart-splits').swap_buf_down, { desc = 'Swap with below' })
    vim.keymap.set('n', '<leader>wk', require('smart-splits').swap_buf_up, { desc = 'Swap with above' })
    vim.keymap.set('n', '<leader>wl', require('smart-splits').swap_buf_right, { desc = 'Swap with right' })
  end,
}
