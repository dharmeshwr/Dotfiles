return {
  {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*",
    config = function()
      vim.keymap.set("n", "<space>ssc", "<cmd>Screenkey<CR>")
    end
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
      { "<space>cc", "<cmd>CodeSnap<cr>",     mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<space>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
    opts = {
      save_path = "~/Pictures",
      has_breadcrumbs = true,
      bg_theme = "bamboo",
      has_line_number = true,
      code_font_family = "SF Mono",
    },
  },
}
