require("ninjafire.lazy")

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Opens a blank buffer when nvim opens",
  group = augroup,
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd([[
        enew
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
        setlocal nobuflisted
      ]])
    end
  end,
})

-- After you yank (copy) text, it highlights the copied region briefly.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking(copying) text",
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Automatically enter insert mode when opening or re-entering a terminal
vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  group = augroup,
  pattern = "term://*",
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.opt.number = false
      vim.opt.relativenumber = false
      vim.opt_local.signcolumn = "no"
      vim.cmd("startinsert")
    end
  end,
})

-- When reopening a file, it jumps back to the last cursor position where you left off.
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- When a terminal job exits successfully (status 0), it automatically closes that buffer.
vim.api.nvim_create_autocmd("TermClose", {
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})


-- When you resize your terminal window or Neovim window, it automatically resizes all splits evenly.
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Before saving a file, it automatically creates missing directories if needed.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- Auto-build and restart suckless tools when config files change
vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup,
  pattern = "*",
  callback = function(ev)
    local file = vim.api.nvim_buf_get_name(ev.buf)
    if not file or file == "" then
      return
    end

    local softwares_root = vim.fn.fnamemodify(vim.fn.expand("~/.dotfiles/suckless/softwares"), ":p")

    -- ensure the saved file is inside the softwares root
    if file:sub(1, #softwares_root) ~= softwares_root then
      return
    end

    local filedir = vim.fn.fnamemodify(file, ":p:h")
    local rel = filedir:sub(#softwares_root + 1) -- may start with "/"
    rel = rel:gsub("^/", "")                     -- strip leading slash
    local topdir = rel:match("^([^/]+)")         -- first path component

    if not topdir or topdir == "" or topdir == 'sxhkd' then
      return
    end

    local project_dir = softwares_root .. "/" .. topdir

    -- NOTE: if sudo prompts for password this will hang / not be interactive.
    -- Remove "sudo" if you don't want password prompts, or handle via other means.
    local cmd = string.format(
      "cd %q && sudo make clean install",
      project_dir
    )

    -- run async: use bash -lc so shell constructs work
    local jid = vim.fn.jobstart({ "bash", "-lc", cmd }, {
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = function(_, data, _)
        if data and #data > 0 then
          local s = table.concat(data, "\n")
          vim.schedule(function()
            vim.notify(s, vim.log.levels.INFO, { title = "Build stdout: " .. topdir })
          end)
        end
      end,
      on_stderr = function(_, data, _)
        if data and #data > 0 then
          local s = table.concat(data, "\n")
          vim.schedule(function()
            vim.notify(s, vim.log.levels.WARN, { title = "Build stderr: " .. topdir })
          end)
        end
      end,
      on_exit = function(_, code, _)
        vim.schedule(function()
          if code == 0 then
            vim.notify("Build/install succeeded: " .. topdir, vim.log.levels.INFO, { title = "SucklessAutoBuild" })
          else
            vim.notify("Build/install FAILED (" .. tostring(code) .. "): " .. topdir, vim.log.levels.ERROR,
              { title = "SucklessAutoBuild" })
          end
        end)
      end,
    })

    if jid <= 0 then
      vim.schedule(function()
        vim.notify("Failed to start build job for " .. topdir, vim.log.levels.ERROR, { title = "SucklessAutoBuild" })
      end)
    else
      vim.schedule(function()
        vim.notify("Started build job for " .. topdir .. " (job id: " .. tostring(jid) .. ")", vim.log.levels.INFO,
          { title = "SucklessAutoBuild" })
      end)
    end
  end,
})
