return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua", "vim", "vimdoc", "query",
          "javascript", "typescript", "tsx",
          "html", "css", "json", "markdown", "markdown_inline",
          "bash", "c",
        },
        auto_install = true,
        highlight = {
          enable = true,
          -- mdx.nvim starts the markdown parser itself for "mdx" buffers;
          -- letting this module also auto-attach double-registers the
          -- highlighter on the same parser tree and corrupts injection
          -- state (crashes with "attempt to call method 'range' (a nil
          -- value)" in the decoration provider).
          disable = function(_, bufnr)
            return vim.bo[bufnr].filetype == "mdx"
          end,
        },
        indent = { enable = true },
      }
    end
  }
}
