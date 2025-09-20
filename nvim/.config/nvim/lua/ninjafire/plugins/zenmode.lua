return {
  "folke/zen-mode.nvim",
  config = function()
    vim.keymap.set("n", "<leader>zz", function()
      require("zen-mode").setup {
        window = {
          backdrop = 0.70,
          width = .6,
          options = {
          }
        },
        plugins = {
          options = {
            enabled = true,
            ruler = false,
            showcmd = false,
            laststatus = 0,
          },
          tmux = { enabled = true }
        }
      }
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.wo.rnu = true
    end)
  end
}
