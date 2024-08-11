return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		enabled = false,
		-- config = function()
		-- 	vim.cmd("colorscheme gruvbox")
		-- end,

		opts = {
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		},
	},

	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_enable_bold = 1
			vim.g.gruvbox_material_ui_contrast = "high"
			vim.g.gruvbox_material_inlay_hints_background = "dimmed"
			vim.g.gruvbox_material_float_style = "dim"
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
