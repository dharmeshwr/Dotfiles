return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local pattern = require 'mini.hipatterns'
      pattern.setup {}

      -----------------------------------------------------------
      local icons = require 'mini.icons'
      icons.setup {}
      -----------------------------------------------------------

      local statusline = require 'mini.statusline'
      statusline.setup { useicons = true }

      -----------------------------------------------------------
      local bracketed = require 'mini.bracketed'
      bracketed.setup {}

      -----------------------------------------------------------
      -- local git = require 'mini.git'
      -- git.setup {}

      -----------------------------------------------------------
      -- local diff = require 'mini.diff'
      -- diff.setup {}

      -----------------------------------------------------------
      local comment = require 'mini.comment'
      comment.setup {}

      -----------------------------------------------------------
      local ai = require 'mini.ai'
      ai.setup {}

      -----------------------------------------------------------
      local pairs = require 'mini.pairs'
      pairs.setup({ modes = { insert = true, command = true, terminal = true } })

      -----------------------------------------------------------
      local indent = require 'mini.indentscope'
      indent.setup {
        draw = {
          animation = function()
            return 1
          end,
        },
        symbol = "│",
      }

      -----------------------------------------------------------
      local starter = require 'mini.starter'
      starter.setup {
        autoopen = true,
        --       header = [[
        -- ███╗   ██╗██╗███╗   ██╗     ██╗ █████╗ ███████╗██╗██████╗ ███████╗
        -- ████╗  ██║██║████╗  ██║     ██║██╔══██╗██╔════╝██║██╔══██╗██╔════╝
        -- ██╔██╗ ██║██║██╔██╗ ██║     ██║███████║█████╗  ██║██████╔╝█████╗
        -- ██║╚██╗██║██║██║╚██╗██║██   ██║██╔══██║██╔══╝  ██║██╔══██╗██╔══╝
        -- ██║ ╚████║██║██║ ╚████║╚█████╔╝██║  ██║██║     ██║██║  ██║███████╗
        -- ╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝ ╚════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝
        --       ]],
        header = [[
⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷
⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇
⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽
⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕
⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕
⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕
⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄
⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕
⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿
⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟
⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠
⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙
⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣
        ]],
        items = {
          { name = "Create Note",  action = ":lua create_note()",                                       section = "" },
          { name = "Open file",    action = ":Telescope find_files",                                    section = "" },
          { name = "Recent Files", action = ":lua require('telescope').extensions.recent_files.pick()", section = "" },
          { name = "Quit Neovim",  action = ":qa!",                                                     section = "" }
        },
        -- content_hooks = {
        --   starter.gen_hook.adding_bullet("- "),
        --   starter.gen_hook.aligning("center", "center")
        -- },
        footer = ""
      }

      -----------------------------------------------------------
      local sessions = require('mini.sessions')
      sessions.setup({ directory = '~/.local/share/mivn/misc/sessions', autowrite = true, })
    end
  }
}
