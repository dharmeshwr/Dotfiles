local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--Clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

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

keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Comments
keymap.set("n", "|", "gc", { noremap = true, silent = true })
keymap.set("v", "|", "gc", { noremap = true, silent = true })

keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
keymap.set("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
