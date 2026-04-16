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
      commands = {
        open_media = function(state)
          local node = state.tree:get_node()
          if node.type == "file" then
            local path = node.path
            local ext = path:match("^.+%.(.+)$")
            if not ext then return end
            ext = string.lower(ext)

            local image_exts = { png = true, jpg = true, jpeg = true, gif = true, webp = true, svg = true }
            local video_exts = { mp4 = true, mkv = true, webm = true, avi = true, mov = true }

            local cmd
            if image_exts[ext] then
              cmd = { "open", "-.", path }
            elseif video_exts[ext] then
              cmd = { "open", path }
            else
              vim.notify("Not a mapped media file", vim.log.levels.INFO)
              return
            end
            vim.fn.jobstart(cmd, { detach = true })
          end
        end,
      },

      window = {
        position = "left",
        width = 45,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["O"] = "open_media",
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
          never_show = { ".git", "node_modules", "__pycache__" },
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
