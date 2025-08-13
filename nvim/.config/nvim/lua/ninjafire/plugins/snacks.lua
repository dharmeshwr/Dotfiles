return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "colorscript -e square",
          height = 5,
          padding = 1,
        },
        { section = "keys",  gap = 1, padding = 1 },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              section = "terminal",
              icon = " ",
              title = "Git Status",
              cmd =
              "set output $(git --no-pager diff --stat -B -M -C); [ -n \"$output\" ] && echo \"$output\" || echo 'That's right, It's empty'",
              height = 10,
            },
            {
              section = "terminal",
              icon = " ",
              title = "Branch Info",
              cmd = "git branch -vv && echo '' && git remote -v",
              height = 6,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = "startup" },
      },
    }
  }
}
