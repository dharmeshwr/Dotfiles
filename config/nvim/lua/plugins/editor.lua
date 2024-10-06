return {
	-- Hihglight colors
	{
		"echasnovski/mini.hipatterns",
		enabled = false,
		event = "BufReadPre",
		opts = {},
	},
	{ "ThePrimeagen/git-worktree.nvim" },
	{
		"NeogitOrg/neogit",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		opts = {
			border = "rounded",
			has_breadcrumbs = true,
			bg_theme = "grape",
			watermark = "",
		},
	},
	{
		"telescope.nvim",
		priority = 1000,
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = {
			{
				"<space>k",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files()
				end,
				desc = "Search for files in your current working directory",
			},
			{
				"<space>h",
				function()
					local builtin = require("telescope.builtin")
					builtin.grep_string()
				end,
				desc = "Search for the current word under the cursor",
			},
			{
				"<space>j",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep()
				end,
				desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
			},
			{
				"<space>xx",
				function()
					local builtin = require("telescope.builtin")
					builtin.diagnostics()
				end,
				desc = "Search through diagnostics",
			},
			{
				"<space><space>",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
				desc = "Find existing buffers",
			},
			{
				"<leader>sS",
				function()
					local builtin = require("telescope.builtin")
					builtin.git_status()
				end,
				desc = "Search Git status",
			},
			{
				"<space>sr",
				function()
					require("telescope").extensions.git_worktree.git_worktrees()
				end,
				desc = "Search through git worktrees",
			},
			{
				"<space>sR",
				function()
					require("telescope").extensions.git_worktree.create_git_worktree()
				end,
				desc = "Create a new git worktree",
			},
			{
				"<space>sn",
				function()
					require("telescope").extensions.notify.notify()
				end,
				desc = "Search through notifications",
			},
			{
				"st",
				":TodoTelescope<CR>",
				desc = "Search through TODOs",
				noremap = true,
			},
			{
				"<space><tab>",
				function()
					local builtin = require("telescope.builtin")
					builtin.commands()
				end,
				desc = "Search through available commands",
				noremap = false,
			},
			{
				"\\\\",
				function()
					local builtin = require("telescope.builtin")
					builtin.resume()
				end,
				desc = "Resume the previous telescope picker",
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {},
				},
				file_ignore_patterns = {
					"node_modules",
				},
			})
			opts.pickers = {
				diagnostics = {
					theme = "dropdown",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			}
			opts.extensions = {
				file_browser = {
					theme = "dropdown",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["n"] = {
							-- your custom normal mode mappings
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
						},
					},
				},
			}
			telescope.setup(opts)
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
			popup_border_style = "rounded",
			enable_git_status = false,
			enable_diagnostics = false,
			open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
			sort_case_insensitive = false, -- used when sorting files and directories in the tree
			sort_function = nil, -- use a custom function for sorting files and directories in the tree
			filesystem = {
				filtered_items = {
					visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
			-- sort_function = function (a,b)
			--       if a.type == b.type then
			--           return a.path > b.path
			--       else
			--           return a.type > b.type
			--       end
			--   end , -- this sorts files and directories descendantly
			default_component_configs = {
				container = {
					enable_character_fade = true,
				},
				indent = {
					indent_size = 2,
					padding = 1, -- extra padding on left hand side
					-- indent guides
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
					-- expander config, needed for nesting files
					with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
					-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
					-- then these will never be used.
					default = "*",
					highlight = "NeoTreeFileIcon",
				},
				modified = {
					symbol = "[+]",
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "✖", -- this can only be used in the git_status source
						renamed = "󰁕", -- this can only be used in the git_status source
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
				-- If you don't want to use these columns, you can set `enabled = false` for each of them individually
				file_size = {
					enabled = true,
					required_width = 64, -- min width of window required to show this column
				},
				type = {
					enabled = true,
					required_width = 122, -- min width of window required to show this column
				},
				last_modified = {
					enabled = true,
					required_width = 88, -- min width of window required to show this column
				},
				created = {
					enabled = true,
					required_width = 110, -- min width of window required to show this column
				},
				symlink_target = {
					enabled = false,
				},
			},
			window = {
				position = "left",
				width = 30,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
			},
		},
		keys = {
			{
				"<F2>",
				function()
					require("neo-tree.command").execute({ toggle = true })
				end,
				desc = "Toggle Neo-tree",
			},
		},
	},
	{
		"folke/twilight.nvim",
		ft = "markdown",
		opts = {
			dimming = {
				alpha = 0.25,
				color = { "Normal", "#ffffff" },
				term_bg = "#000000",
				inactive = false,
			},
			context = 10,
			treesitter = true,
			expand = {
				"function",
				"method",
				"table",
				"if_statement",
			},
			exclude = {},
		},
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 15, -- Height of the floating window
				border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
				default_mappings = true,
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				references = { -- Configure the telescope UI for slowing the references cycling window.
					telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
				},
				-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
				focus_on_open = true, -- Focus the floating window when opening it.
				dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
				force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
				bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
				stack_floating_preview_windows = true, -- Whether to nest floating windows
				preview_window_title = { enable = true, position = "left" }, -- Whether
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			current_line_blame = false,
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
				map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
				map("n", "<leader>hS", gs.stage_buffer)
				map("n", "<leader>ha", gs.stage_hunk)
				map("n", "<leader>hu", gs.undo_stage_hunk)
				map("n", "<leader>hR", gs.reset_buffer)
				map("n", "<leader>hp", gs.preview_hunk)
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end)
				map("n", "<leader>tB", gs.toggle_current_line_blame)
				map("n", "<leader>hd", gs.diffthis)
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			-- nvim-cmp setup
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				view = {
					entries = "native",
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "neorg" },
				},
			})
		end,
	},
	-- {
	-- 	"akinsho/toggleterm.nvim",
	-- 	version = "*",
	-- 	opts = {
	-- 		size = 22,
	-- 		open_mapping = [[<c-\>]],
	-- 		hide_numbers = true,
	-- 		shade_filetypes = {},
	-- 		shade_terminals = true,
	-- 		shading_factor = 2,
	-- 		start_in_insert = true,
	-- 		insert_mappings = true,
	-- 		persist_size = true,
	-- 		direction = "float",
	-- 		close_on_exit = true,
	-- 		shell = vim.o.shell,
	-- 		float_opts = {
	-- 			winblend = 0,
	-- 			width = 180,
	-- 			height = 45,
	-- 			border = "single",
	-- 		},
	-- 	},
	-- },
}
