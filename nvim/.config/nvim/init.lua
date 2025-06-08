require("ninjafire.lazy")

-- Transparency
-- vim.cmd [[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
-- ]]

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking(copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

function create_note()
  local notes_dir = vim.fn.expand("~/Workspace/notes")
  local note_name = vim.fn.input("Note name: ")
  if note_name == nil or note_name == '' then
    vim.cmd("enew")
  else
    local file_name = note_name .. ".md"
    local note_path = notes_dir .. "/" .. file_name
    vim.fn.mkdir(notes_dir, "p")
    vim.cmd("edit " .. note_path)
  end
end
