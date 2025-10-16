return {
  -- Catppuccin theme - popular pastel theme with multiple flavors
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      transparent_background = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = true,
        which_key = true,
        dap = true,
        dap_ui = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
          },
        },
      },
    },
  },

  -- TokyoNight - vibrant dark theme
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
      style = 'night', -- storm, moon, night, day
      transparent = false,
      styles = {
        comments = { italic = false },
        sidebars = 'dark',
        floats = 'dark',
      },
    },
  },

  -- Gruvbox - retro groove warm theme
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = {
      transparent_mode = false,
    },
  },

  -- Kanagawa - dark theme inspired by famous painting
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      transparent = false,
      theme = 'wave', -- wave, dragon, lotus
    },
  },

  -- Rose Pine - low contrast theme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    opts = {
      variant = 'moon', -- auto, main, moon, dawn
      disable_background = false,
      disable_float_background = false,
    },
  },

  -- Nightfox - collection of fox-themed colorschemes
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    opts = {
      options = {
        transparent = false,
      },
    },
  },

  -- Onedark - Atom's iconic One Dark theme
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    opts = {
      style = 'dark', -- dark, darker, cool, deep, warm, warmer
      transparent = false,
    },
  },

  -- Nord - Arctic, north-bluish theme
  {
    'shaunsingh/nord.nvim',
    priority = 1000,
    config = function()
      vim.g.nord_disable_background = false
      vim.g.nord_borders = true
    end,
  },

  -- Panda - VSCode's superminimal dark syntax theme
  {
    'markvincze/panda-vim',
    priority = 1000,
  },

  -- Field Lights - Warm, green-tinted theme for long coding sessions
  -- Note: If this doesn't exist, using everforest as alternative
  {
    'sainnhe/everforest',
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'medium' -- hard, medium, soft
      vim.g.everforest_better_performance = 1
      vim.g.everforest_transparent_background = 0
    end,
  },

  -- Sonokai - High contrast & vivid theme
  {
    'sainnhe/sonokai',
    priority = 1000,
    config = function()
      vim.g.sonokai_style = 'default' -- default, atlantis, andromeda, shusia, maia, espresso
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_transparent_background = 0
    end,
  },

  -- Dracula - Famous purple-ish dark theme
  {
    'Mofiqul/dracula.nvim',
    priority = 1000,
    opts = {
      transparent_bg = false,
      italic_comment = true,
    },
  },

  -- Monokai Pro - Classic sublime text theme
  {
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    opts = {
      transparent_background = false,
      filter = 'pro', -- pro, classic, octagon, ristretto, spectrum, machine
    },
  },

  -- Ayu - Simple, bright and elegant theme
  {
    'Shatur/neovim-ayu',
    priority = 1000,
    config = function()
      require('ayu').setup {
        mirage = true, -- Set to true for mirage variant
      }
    end,
  },

  -- Material - Google's Material Design
  {
    'marko-cerovac/material.nvim',
    priority = 1000,
    opts = {
      contrast = {
        terminal = false,
        sidebars = false,
        floating_windows = false,
      },
      styles = {
        comments = { italic = true },
      },
      disable = {
        background = false,
      },
    },
  },

  -- GitHub theme - Light and dark variants
  {
    'projekt0n/github-nvim-theme',
    priority = 1000,
    opts = {
      options = {
        transparent = false,
      },
    },
  },

  -- Melange - Warm, cozy colorscheme
  {
    'savq/melange-nvim',
    priority = 1000,
  },

  -- Set default colorscheme
  {
    'Shatur/neovim-ayu',
    config = function()
      require('ayu').setup {
        mirage = true,
      }
      vim.cmd.colorscheme 'ayu'
    end,
  },
}
