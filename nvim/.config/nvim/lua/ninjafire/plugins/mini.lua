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
      local move = require 'mini.move'
      move.setup {}

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
      local notify = require 'mini.notify'
      notify.setup({
        content = {
          sort = function(notif_arr)
            table.sort(notif_arr, function(a, b) return a.ts_add < b.ts_add end)
            return notif_arr
          end,
        },
        lsp_progress = { enable = false },
        window = {
          config = { anchor = "NE", border = "single" },
          max_width_share = 0.4, -- up to 40% of the screen width
          winblend = 10,         -- transparency
        },
      })

      vim.keymap.set("n", "<leader>nn", function()
        notify.clear()
      end, { desc = "Notifications: Dismiss all" })


      vim.notify = notify.make_notify({
        ERROR = { duration = 15000 }, -- 15s
        WARN  = { duration = 10000 }, -- 10s
        INFO  = { duration = 8000 },  -- 8s
        DEBUG = { duration = 5000 },  -- 5s
        TRACE = { duration = 3000 },  -- 3s
      })
    end
  }
}
