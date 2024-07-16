return {
  "nvim-neo-tree/neo-tree.nvim",
  event = 'VimEnter',
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = false,
    enable_diagnostics = false,
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    sort_function = nil, -- use a custom function for sorting files and directories in the tree
    filesystem = {
      filtered_items = {
        visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
    -- sort_function = function (a,b)
      --       if a.type == b.type then
      --           return a.path > b.path
      --       else
      --           return a.type > b.type
      --       end
      --   end , -- this sorts files and directories descendantly
    -- default_component_configs = {
      -- container = {
      --   enable_character_fade = true,
      -- },
      -- indent = {
      --   indent_size = 2,
      --   padding = 1, -- extra padding on left hand side
      --   -- indent guides
      --   with_markers = true,
      --   indent_marker = "│",
      --   last_indent_marker = "└",
      --   highlight = "NeoTreeIndentMarker",
      --   -- expander config, needed for nesting files
      --   with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      --   expander_collapsed = "",
      --   expander_expanded = "",
      --   expander_highlight = "NeoTreeExpander",
      -- },
      -- icon = {
      --   folder_closed = "",
      --   folder_open = "",
      --   folder_empty = "󰜌",
      --   -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      --   -- then these will never be used.
      --   default = "*",
      --   highlight = "NeoTreeFileIcon",
      -- },
      -- modified = {
      --   symbol = "[+]",
      --   highlight = "NeoTreeModified",
      -- },
      -- name = {
      --   trailing_slash = false,
      --   use_git_status_colors = true,
      --   highlight = "NeoTreeFileName",
      -- },
    --   git_status = {
    --     symbols = {
    --       -- Change type
    --       added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
    --       modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
    --       deleted = "✖", -- this can only be used in the git_status source
    --       renamed = "󰁕", -- this can only be used in the git_status source
    --       -- Status type
    --       untracked = "",
    --       ignored = "",
    --       unstaged = "󰄱",
    --       staged = "",
    --       conflict = "",
    --     },
    --   },
    -- }
    -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
    file_size = {
      enabled = true,
      required_width = 64, -- min width of window required to show this column
    },
    type = {
      enabled = true,
      required_width = 122, -- min width of window required to show this column
    },
    last_modified = {
      enabled = true,
      required_width = 88, -- min width of window required to show this column
    },
    created = {
      enabled = true,
      required_width = 110, -- min width of window required to show this column
    },
    symlink_target = {
      enabled = false,
    },
  },
  window = {
    position = "left",
    width = 30,
    mapping_options = {
      noremap = true,
      nowait = true,
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
  },
}
