return {
	{
		'mfussenegger/nvim-lint',
		keys = {
			{
				'<leader>cin',
				function()
					vim.notify(vim.inspect(require('lint').linters[vim.bo.filetype]))
				end,
				silent = true,
				desc = 'Linter Info',
			},
		},
	},
}
