local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--Clipboard
keymap.set({ "n", "v" }, "<leader>j", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- File commands
keymap.set("n", "QQ", ":q!<CR>", { noremap = false })
keymap.set("n", "Q", ":bd<CR>", { noremap = false })
keymap.set("n", "WW", ":w!<CR>", { noremap = false })
keymap.set("n", "E", "$", { noremap = false })
keymap.set("n", "B", "^", { noremap = false })
keymap.set("n", "<C-c>", "<cmd>noh<CR>", { noremap = false })

-- Word wrap navigation
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


vim.keymap.set({ "n", "i", "v" }, "<F1>", "<Nop>", { noremap = true, silent = true }) -- Disable F1 in normal mode
keymap.set("n", "x", '"_x')

-- Move window
keymap.set("n", "sh", "<C-w><C-h>")
keymap.set("n", "sk", "<C-w><C-k>")
keymap.set("n", "sj", "<C-w><C-j>")
keymap.set("n", "sl", "<C-w><C-l>")

-- Resize window
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Up/Down navigation
keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
keymap.set("n", "<space>x", ":.lua<CR>")
keymap.set("v", "<space>x", ":lua<CR>")

keymap.set('n', '-', "<cmd>Oil<CR>")

-- Better indenting in visual mode
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better paste behavior
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

keymap.set("n", "<C-h>", "<cmd>cprev<CR>")
keymap.set("n", "<C-j>", "<cmd>cnext<CR>")

keymap.set("n", "<C-k>", "<cmd>bprevious<CR>", opts)
keymap.set("n", "<C-l>", "<cmd>bnext<CR>", opts)

-- optional: cycle through buffers
keymap.set("n", "<C-S-K>", "<cmd>bfirst<CR>", opts)
keymap.set("n", "<C-S-L>", "<cmd>blast<CR>", opts)

-- toggle status bar
keymap.set('n', '<F3>', function()
  local currentStatus = vim.o.laststatus;
  if currentStatus == 3 then
    vim.o.laststatus = 0;
    -- vim.o.cmdheight = 0
  else
    vim.o.laststatus = 3;
    -- vim.o.cmdheight = 1
  end
end)

-- toggle diagnostics lines
keymap.set('n', '\\\\', function()
  local current_config = vim.diagnostic.config() or {}
  local is_enabled = current_config.virtual_lines or false

  vim.diagnostic.config({ virtual_lines = not is_enabled })
end)

-- Duplicate a line
keymap.set('n', 'dq', 'yyp')

-- Duplicate a line with commenting the previous one
-- keymap.set('n', '', function()
-- vim.cmd('normal! yy')
-- vim.cmd('normal gcc')
-- vim.cmd('normal! p')
-- end)

vim.keymap.set("n", "<leader>cl", function()
  local word = vim.fn.expand("<cword>") -- word under cursor
  local line = vim.api.nvim_get_current_line()
  local row = vim.api.nvim_win_get_cursor(0)[1]

  -- insert console.log on the next line
  vim.api.nvim_buf_set_lines(0, row, row, false, { "console.log(" .. word .. ")" })
end, { desc = "Insert console.log for word under cursor" })

return {}
