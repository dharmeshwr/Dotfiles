return {
  {
    "rose-pine/neovim",
    enabled = true,
    lazy = false,
    name = "rose-pine",
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_enable_bold = 0
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "dim"
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    enabled = true,
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        float = {
          transparent = false, -- enable transparent floating windows
          solid = false,       -- use solid styling for floating windows, see |winborder|
        },
      })
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
    opts = {},
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('everforest').setup({
        background = "hard",
        transparent_background_level = 0,
        italics = true,
        disable_italic_comments = false,
        inlay_hints_background = "dimmed",
        on_highlights = function(hl, _)
          hl["@string.special.symbol.ruby"] = { link = "@field" }
        end,
      })
    end
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup({})
    end,
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  }
}
