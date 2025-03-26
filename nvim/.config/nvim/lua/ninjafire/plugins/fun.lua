return {
  {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*",
    config = function()
      vim.keymap.set("n", "<space>ssc", "<cmd>Screenkey<CR>")
      require("screenkey").setup({
        win_opts = {
          width = 10,
          height = 1,
          border = "single",
          title = "",
          title_pos = "center",
          style = "minimal",
        }
      })
    end
  },
  {
    'eandrju/cellular-automaton.nvim',
    config = function()
      vim.keymap.set("n", "<leader>fcm", "<cmd>CellularAutomaton make_it_rain<CR>")
      vim.keymap.set("n", "<leader>fcg", "<cmd>CellularAutomaton game_of_life<CR>")
    end
  },
  {
    "mistricky/codesnap.nvim",
    enabled = true,
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
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    enabled = false,
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
    },
    config = function()
      require("barbecue").setup({
        create_autocmd = false,
      })
      vim.api.nvim_create_autocmd({
        "WinScrolled",
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end,
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  }
}
