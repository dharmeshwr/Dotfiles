return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      enable_git_status = false,
      popup_border_style = "rounded",
      window = {
        position = "left",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_default",
        filtered_items = {
          visible = true,          -- Show hidden files
          hide_dotfiles = false,   -- Do not hide dotfiles (files starting with .)
          hide_gitignored = false, -- Do not hide files ignored by git
          hide_hidden = false,     -- Do not hide hidden files (like .git or node_modules)
          never_show = { ".git", "node_modules" },
          always_show_by_pattern = {
            ".env*",
            ".gitignore",
          }
        },
      },
    },
    keys = {
      {
        "<F2>",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Toggle Neo-tree",
      },
    }
  }
}
