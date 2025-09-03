return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      'nvim-telescope/telescope-ui-select.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "smartpde/telescope-recent-files"
    },

    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy",
            find_command = { "rg", "--files", "--sortr=modified" },
            hidden = true
          },
          buffers = {
            sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            ignore_current_buffer = true,
            layout_config = {
              width = 0.3,
            },
            entry_maker = function(entry)
              local tail = vim.fn.fnamemodify(entry.info.name, ":t")            -- filename
              local parent = vim.fn.fnamemodify(entry.info.name, ":h:t")        -- parent folder
              local grandparent = vim.fn.fnamemodify(entry.info.name, ":h:h:t") -- grandparent folder

              -- devicon
              local icon, hl_group = require("nvim-web-devicons").get_icon(entry.info.name, nil, { default = true })

              return {
                value = entry,
                ordinal = entry.info.name,
                bufnr = entry.bufnr,
                icon = icon,
                hl_group = hl_group,
                display = icon .. " " .. grandparent .. "/" .. parent .. "/" .. tail,
              }
            end,
            mappings = {
              i = {
                ["<C-d>"] = function(prompt_bufnr)
                  local action_state = require("telescope.actions.state")
                  local picker = action_state.get_current_picker(prompt_bufnr)
                  local selections = picker:get_multi_selection()

                  if vim.tbl_isempty(selections) then
                    -- nothing selected → delete current entry
                    local entry = action_state.get_selected_entry()
                    require("mini.bufremove").delete(entry.bufnr, false)
                  else
                    -- multiple marked → delete all
                    for _, entry in ipairs(selections) do
                      require("mini.bufremove").delete(entry.bufnr, false)
                    end
                  end
                end,
              },
              n = {
                ["<C-d>"] = function(prompt_bufnr)
                  local action_state = require("telescope.actions.state")
                  local picker = action_state.get_current_picker(prompt_bufnr)
                  local selections = picker:get_multi_selection()

                  if vim.tbl_isempty(selections) then
                    local entry = action_state.get_selected_entry()
                    require("mini.bufremove").delete(entry.bufnr, false)
                  else
                    for _, entry in ipairs(selections) do
                      require("mini.bufremove").delete(entry.bufnr, false)
                    end
                  end
                end,
              },
            },
          },

          live_grep = {
            theme = "ivy",
          },
        },
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            ".git"
          }
        },
        extensions = {
          fzf = {},
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }

      require("telescope").load_extension("fzf")
      require("telescope").load_extension("ui-select")
      vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files)
      vim.keymap.set("n", "<space>fg", require("telescope.builtin").live_grep)
      vim.keymap.set("n", "<space>k", require("telescope.builtin").buffers)
      vim.keymap.set('n', '<space>rr', require("telescope.builtin").resume)
      vim.keymap.set('n', '<space>sw', require("telescope.builtin").grep_string)

      vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags)
      vim.keymap.set("n", "<space>bb", require("telescope.builtin").builtin)
      vim.keymap.set("n", "<space>cc", require("telescope.builtin").commands)
      vim.keymap.set("n", "<space>en", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)
    end,
  },
}
