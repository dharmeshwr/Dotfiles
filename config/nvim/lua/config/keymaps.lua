local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Twilight
keymap.set("n", "tw", ":Twilight<CR>", { noremap = false })

--Clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- File commands
keymap.set("n", "QQ", ":q!<CR>", { noremap = false })
keymap.set("n", "WW", ":w!<CR>", { noremap = false })
keymap.set("n", "E", "$", { noremap = false })
keymap.set("n", "B", "^", { noremap = false })
keymap.set("n", "TT", ":TransparentToggle<CR>", opts)
keymap.set("n", "ss", ":noh<CR>", opts)

-- Word wrap navigation
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--Code Folding
keymap.set("n", "-", "<cmd>foldclose<CR>")
keymap.set("n", "+", "<cmd>foldopen<CR>")

--Move
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)

