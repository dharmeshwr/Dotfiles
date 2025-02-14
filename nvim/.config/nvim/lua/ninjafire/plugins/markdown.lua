return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    opts = {},
    config = function()
      vim.keymap.set('n', '<space>md', function()
        require('render-markdown').toggle()
      end)
    end
  },
  {
    "davidmh/mdx.nvim",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" }
  }
}
