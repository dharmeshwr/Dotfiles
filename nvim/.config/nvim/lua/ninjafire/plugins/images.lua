return {
  '3rd/image.nvim',
  enabled = false,
  config = function()
    require("image").setup({
      backend = "kitty",        -- or "ueberzug" or "sixel"
      processor = "magick_cli", -- or "magick_rock"
    })
  end
}
