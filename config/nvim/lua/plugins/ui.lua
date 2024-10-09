return {
	{
		"nvimdev/dashboard-nvim",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"folke/which-key.nvim",
		enabled = false,
	},
	{
		"nvim-tree/nvim-tree.nvim",
		enabled = false,
	},
	{
		"akinsho/bufferline.nvim",
		enabled = false,
	},
	{
		"folke/noice.nvim",
		enabled = false,
		opts = function(_, opts)
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})
			local focused = true
			vim.api.nvim_create_autocmd("FocusGained", {
				callback = function()
					focused = true
				end,
			})
			vim.api.nvim_create_autocmd("FocusLost", {
				callback = function()
					focused = false
				end,
			})
			table.insert(opts.routes, 1, {
				filter = {
					cond = function()
						return not focused
					end,
				},
				view = "notify_send",
				opts = { stop = false },
			})

			opts.commands = {
				all = {
					-- options for the message history that you get with `:Noice`
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {},
				},
			}
			opts.presets.lsp_doc_border = true
		end,
		config = function()
			require("noice").setup({
				views = {
					cmdline_popup = {
						border = {
							style = "none",
							padding = { 1, 1 },
						},
						filter_options = {},
						win_options = {
							winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
						},
					},
				},
				cmdline = {
					view = "cmdline_popup",
				},
				format = {
					cmdline = { pattern = "^:", icon = ":", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
					lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
					help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
					input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
					-- lua = false, -- to disable a format, set to `false`
				},
			})
		end,
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
			background_colour = "#000000",
			render = "wrapped-compact",
		},
	},

	{
		"b0o/incline.nvim",
		dependencies = {},
		event = "BufReadPre",
		priority = 1200,
		config = function()
			local helpers = require("incline.helpers")
			require("incline").setup({
				window = {
					padding = 0,
					margin = { horizontal = 0 },
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
					local modified = vim.bo[props.buf].modified
					local buffer = {
						ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
							or "",
						" ",
						{ filename, gui = modified and "bold,italic" or "bold" },
						" ",
						guibg = "#363944",
					}
					return buffer
				end,
			})
		end,
	},

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- {
	-- 	"sainnhe/gruvbox-material",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.gruvbox_material_enable_italic = false
	-- 		vim.g.gruvbox_material_background = "hard"
	-- 		vim.g.gruvbox_material_better_performance = 1
	-- 		vim.g.gruvbox_material_foreground = "mix"
	-- 		vim.g.gruvbox_material_enable_bold = 1
	-- 		vim.g.gruvbox_material_ui_contrast = "high"
	-- 		vim.g.gruvbox_material_float_style = "dim"
	-- 		vim.cmd.colorscheme("gruvbox-material")
	-- 	end,
	-- },

	{ "wakatime/vim-wakatime", lazy = false },
	{ "nvim-telescope/telescope-symbols.nvim" },
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{
		"numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
		event = { "BufRead", "BufNewFile" },
		config = true,
	},
}
