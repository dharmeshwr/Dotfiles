local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--Clipboard
keymap.set({ "n", "v" }, "<leader>j", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- File commands
keymap.set("n", "QQ", ":bd<CR>", { noremap = false })
keymap.set("n", "WW", ":w!<CR>", { noremap = false })
keymap.set("n", "E", "$", { noremap = false })
keymap.set("n", "B", "^", { noremap = false })
keymap.set("n", "<C-c>", "<cmd>noh<CR>", { noremap = false })

-- Word wrap navigation
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

--Code Folding
-- keymap.set("n", "-", "<cmd>foldclose<CR>")
-- keymap.set("n", "+", "<cmd>foldopen<CR>")

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
-- keymap.set("n", "ss", ":split<Return>", opts)
-- keymap.set("n", "sv", ":vsplit<Return>", opts)

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

keymap.set("x", "<Leader>p", '"_dp')

keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
keymap.set("n", "<space>x", ":.lua<CR>")
keymap.set("v", "<space>x", ":lua<CR>")

keymap.set("n", "<c-j>", "<cmd>cnext<CR>")
keymap.set("n", "<c-k>", "<cmd>cprev<CR>")

keymap.set('n', '-', "<cmd>Oil<CR>")

keymap.set('n', '\\\\', function() vim.diagnostic.setqflist() end)

keymap.set('n', '<space>rs', function()
  local currentStatus = vim.o.laststatus;
  if currentStatus == 3 then
    vim.o.laststatus = 0;
    vim.o.cmdheight = 0
  else
    vim.o.laststatus = 3;
    vim.o.cmdheight = 1
  end
end)

-- Duplicate a line
keymap.set('n', 'dq', 'yyp')

-- Duplicate a line with commenting the previous one
keymap.set('n', 'cd', function()
  vim.cmd('normal! yy')
  vim.cmd('normal gcc')
  vim.cmd('normal! p')
end)

return {}
