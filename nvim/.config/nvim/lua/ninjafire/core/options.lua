-- Set leader key to space
vim.g.mapleader = " "

-- Use system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Set script encoding to UTF-8
vim.scriptencoding = "utf-8"

-- Set internal encoding to UTF-8
vim.opt.encoding = "utf-8"

-- Set file encoding to UTF-8
vim.opt.fileencoding = "utf-8"

-- Do not create swap files
vim.opt.swapfile = false

-- Show line numbers
vim.opt.number = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Set window title to filename
vim.opt.title = true

-- Enable automatic indentation
vim.opt.autoindent = true

-- Enable smart indentation
vim.opt.smartindent = true

-- Highlight search results
vim.opt.hlsearch = true

-- Do not create backup files
vim.opt.backup = false

-- Show command in bottom bar
vim.opt.showcmd = true

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Keep 10 lines visible when scrolling
vim.opt.scrolloff = 10

-- Show incremental command results in a split
vim.opt.inccommand = "split"

-- Ignore case in search patterns
vim.opt.ignorecase = true

-- Enable smart tab
vim.opt.smarttab = true

-- Enable break indent
vim.opt.breakindent = true

-- Set shift width to 2 spaces
vim.opt.shiftwidth = 2

-- Set tab stop to 2 spaces
vim.opt.tabstop = 2

-- Disable line wrapping
vim.opt.wrap = false

-- Enable backspace in insert mode
vim.opt.backspace = { "start", "eol", "indent" }

-- Search files recursively
vim.opt.path:append({ "**" })

-- Ignore node_modules directory
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Open horizontal splits below current window
vim.opt.splitbelow = true

-- Open vertical splits to the right of current window
vim.opt.splitright = true

-- Keep cursor in same column when splitting
vim.opt.splitkeep = "cursor"

-- Disable mouse support
-- vim.opt.mouse = ""

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Manual folds using zf
vim.opt.foldmethod = "manual"

-- Common status bar across all splits
vim.opt.laststatus = 3

-- Alias :W to :w
vim.api.nvim_command("command W w")

-- Alias :Q to :q
vim.api.nvim_command("command Q q")

vim.api.nvim_command("command WQ wq")

vim.api.nvim_command("command Wq wq")

-- Hide command line when not needed
-- vim.opt.cmdheight = 0

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.opt.signcolumn = 'yes'

-- Save undo history
vim.o.undofile = true

vim.o.completeopt = "menuone,noselect"

-- Concealer for Neorg
vim.o.conceallevel = 2

-- vim.opt.colorcolumn = "120"

vim.opt.numberwidth = 1

return {}
