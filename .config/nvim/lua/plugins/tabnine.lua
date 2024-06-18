return {
  "nvim-cmp",
  enabled = false,
  dependencies = {
    {
      "tzachar/cmp-tabnine",
      "hrsh7th/cmp-emoji",
      build = {
        LazyVim.is_win() and "pwsh -noni .\\install.ps1" or "./install.sh",
        ":CmpTabnineHub",
      },
      dependencies = "hrsh7th/nvim-cmp",
      opts = {
        max_lines = 1000,
        max_num_results = 3,
        sort = true,
      },
      config = function(_, opts)
        require("cmp_tabnine.config"):setup(opts)
      end,
    },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, 1, {
      name = "cmp_tabnine",
      group_index = 1,
      priority = 100,
    })

    table.insert(opts.sources, { name = "emoji" })
    opts.formatting.format = LazyVim.inject.args(opts.formatting.format, function(entry, item)
      -- Hide percentage in the menu
      if entry.source.name == "cmp_tabnine" then
        item.menu = ""
      end
    end)
  end,
}
