return {
	"nvim-lualine/lualine.nvim",
	enabled = false,
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 3
		end
	end,
	opts = function()
		-- PERF: we don't need this lualine require madness 🤷
		local lualine_require = require("lualine_require")
		lualine_require.require = require

		local icons = LazyVim.config.icons

		vim.o.laststatus = vim.g.lualine_laststatus

		local opts = {
			-- options = {
			-- 	theme = "auto",
			-- 	component_separators = { left = "", right = "" },
			-- 	section_separators = { left = "", right = "" },
			-- 	globalstatus = vim.o.laststatus == 3,
			-- 	disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
			-- },
			options = {
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
			},
			sections = {
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_a = {
					{
						"buffers",
					},
				},
			},
		}

		-- do not add trouble symbols if aerial is enabled
		-- if vim.g.trouble_lualine then
		--   local trouble = require("trouble")
		--   local symbols = trouble.statusline
		--     and trouble.statusline({
		--       mode = "symbols",
		--       groups = {},
		--       title = false,
		--       filter = { range = true },
		--       format = "{kind_icon}{symbol.name:Normal}",
		--       hl_group = "lualine_c_normal",
		--     })
		--   table.insert(opts.sections.lualine_c, {
		--     symbols and symbols.get,
		--     cond = symbols and symbols.has,
		--   })
		-- end

		return opts
	end,
}
