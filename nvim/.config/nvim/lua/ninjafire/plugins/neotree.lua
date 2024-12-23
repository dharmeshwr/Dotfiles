return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    opts = {
      popup_border_style = "rounded",
      window = {
        position = "left",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
    },
    filesystem = {
      always_show = {
        ".env"
      }
    },
    keys = {
      {
        "<space>ee",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Toggle Neo-tree",
      },
    }
  }
}
