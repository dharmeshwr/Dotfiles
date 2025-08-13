return {
  {
    "rose-pine/neovim",
    enabled = false,
    name = "rose-pine",
    config = function() vim.cmd("colorscheme rose-pine") end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "dim"
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function() vim.cmd("colorscheme solarized-osaka") end,
    opts = {},
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function() vim.cmd("colorscheme tokyonight") end,
    opts = {},
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup({})
      vim.cmd('colorscheme github_dark_default')
    end,
  },
}
