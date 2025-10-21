-- Leader Key
vim.g.mapleader = " "      -- Set <Leader> key to space for custom shortcuts
vim.g.maplocalleader = " " -- Set local leader key (NEW)

-- General Settings
vim.scriptencoding = "utf-8"                     -- Set script encoding to UTF-8
vim.opt.encoding = "utf-8"                       -- Set internal encoding to UTF-8
vim.opt.fileencoding = "utf-8"                   -- Set file encoding to UTF-8
vim.o.cmdheight = 0                              -- Hide command line (0 = auto-hide in Neovim 0.9+)
vim.opt.title = true                             -- Show filename in window title
vim.o.completeopt = "menuone,noselect,noinsert"  -- Better completion menu behavior
vim.o.conceallevel = 0                           -- Hide concealed text (useful for Markdown, LaTeX)
vim.opt.concealcursor = ""                       -- Don't hide cursor line markup
vim.opt.signcolumn = "yes"                       -- Always show sign column to avoid text shift
vim.opt.numberwidth = 1                          -- Minimum width for line number column
vim.opt.laststatus = 3                           -- Global statusline across all splits
vim.opt.termguicolors = true                     -- Enable 24-bit color (true color support)
vim.opt.lazyredraw = true                        -- Don't redraw during macros
vim.opt.synmaxcol = 300                          -- Syntax highlighting limit
vim.opt.backspace = { "start", "eol", "indent" } -- Make backspace behave normally in insert mode
vim.opt.clipboard:append("unnamedplus")          -- Use system clipboard for all yank/paste operations
vim.opt.hidden = true                            -- switch buffers without saving the current one
vim.opt.iskeyword:append("-")                    -- Treat dash as part of word
vim.opt.mouse = "a"                              -- mouse support in all modes
vim.opt.errorbells = false                       -- No error bells
vim.opt.diffopt:append("linematch:60")           -- Makes diffs more readable and context-aware.

vim.opt.redrawtime = 10000                       --how long Neovim waits before stopping screen redraw
vim.opt.maxmempattern = 20000                    -- allows larger regex matches for syntax highlighting

-- Files & Backups
vim.opt.swapfile = false    -- Disable swap files
vim.opt.backup = false      -- Disable backup files
vim.opt.backup = false      -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false    -- Don't create swap files
vim.opt.updatetime = 300    -- Faster completion
vim.o.undofile = true       -- Enable persistent undo (undo history saved between sessions)
vim.opt.timeoutlen = 500    -- Key timeout duration
vim.opt.ttimeoutlen = 0     -- Key code timeout
vim.opt.autoread = true     -- Auto reload files changed outside vim
vim.opt.autowrite = false   -- Don't auto save

-- Indentation & Formatting
vim.opt.autoindent = true             -- Maintain indent from current line
vim.opt.smartindent = true            -- Smarter indentation for code blocks
vim.opt.expandtab = true              -- Convert tabs to spaces
vim.opt.shiftwidth = 2                -- Indent width of 2 spaces
vim.opt.tabstop = 2                   -- A tab equals 2 spaces
vim.opt.softtabstop = 2               -- Soft tab stop
vim.opt.smarttab = true               -- Insert correct number of spaces with Tab
vim.opt.breakindent = true            -- Preserve indentation when wrapping lines
vim.opt.formatoptions:append({ "r" }) -- Continue comments with asterisks when pressing Enter

-- Fold
vim.opt.foldmethod = "expr" -- manual/expr code folding
vim.opt.foldlevel = 99      -- Start with all folds open
vim.opt.foldenable = true   -- Enable folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Search Settings
vim.opt.hlsearch = true                           -- Highlight all search matches
vim.opt.ignorecase = true                         -- Case-insensitive searching
vim.opt.smartcase = true                          -- Case sensitive if uppercase in search
vim.opt.incsearch = true                          -- Show matches as you type
vim.opt.inccommand = "split"                      -- Show live preview of substitute commands (:%s)
vim.opt.path:append({ "**" })                     -- Search files recursively with :find
vim.opt.wildignore:append({ "*/node_modules/*" }) -- Ignore node_modules when searching

-- Visual Settings
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.wrap = false          -- Disable line wrapping
vim.opt.cursorline = true     -- Highlight current line
vim.opt.scrolloff = 10        -- Keep 10 lines visible above/below cursor
vim.o.scrolloff = 10          -- Minimum vertical scroll offset
vim.o.sidescrolloff = 8       -- Minimum horizontal scroll offset
vim.opt.showcmd = true        -- Show typed command in status bar
vim.opt.colorcolumn = "120"   -- Highlight column 120 for code width guide
vim.opt.showmatch = true      -- Highlight matching brackets
vim.opt.matchtime = 2         -- How long to show matching bracket
-- vim.opt.pumheight = 10     -- Popup menu height
-- vim.opt.pumblend = 10      -- Popup menu transparency
-- vim.opt.winblend = 0       -- Floating window transparency

-- Splits & Windows
vim.opt.splitbelow = true    -- Open new horizontal splits below
vim.opt.splitright = true    -- Open new vertical splits to the right
vim.opt.splitkeep = "cursor" -- Keep cursor aligned when opening splits

-- Custom Commands
vim.api.nvim_command("command W w")
vim.api.nvim_command("command Q q")
vim.api.nvim_command("command Wa wa")
vim.api.nvim_command("command WQ wq")
vim.api.nvim_command("command Wq wq")

-- Transparency
-- vim.cmd [[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
--   highlight TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE
-- ]]
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

return {}
