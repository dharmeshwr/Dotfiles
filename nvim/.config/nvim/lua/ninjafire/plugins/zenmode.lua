return {
  "folke/zen-mode.nvim",
  config = function()
    vim.keymap.set("n", "<leader>zz", function()
      require("zen-mode").setup {
        window = {
          width = .6,
          options = {
            signcolumn = "no",
          }
        },
        plugins = {
          options = {
            enabled = true,
            ruler = false,
            showcmd = false,
            laststatus = 0,
          },
          tmux = { enabled = false }
        }
      }
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.wo.rnu = true
    end)
  end
}
