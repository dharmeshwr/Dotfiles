return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { 'saghen/blink.cmp' },
      { "williamboman/mason.nvim", config = true }
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup { capabilities = capabilities }
        end
      }

      -- configuration if mason is not installed
      -- local lspconfig = require("lspconfig")
      -- lspconfig.lua_ls.setup({capabilities = capabilities})
      -- lspconfig.ts_ls.setup({capabilities = capabilities})
      -- lspconfig.clangd.setup({capabilities = capabilities})

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
          end
        end
      })
    end,
    opts = {
      inlayHints = { enabled = true }
    }
  },
}
