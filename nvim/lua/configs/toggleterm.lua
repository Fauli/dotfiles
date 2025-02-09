return function()
  require("toggleterm").setup({
    size = 20,
    hide_numbers = true,
    shade_terminals = true,
    direction = "horizontal",
    float_opts = { border = "curved" },
    -- ✅ Auto-enter insert mode when opening
    on_open = function(term)
      vim.cmd("startinsert")
    end,
  })

  -- 🚀 Auto-enter insert mode when focusing, but allow exiting with `<Esc>` or `<Ctrl-w>`
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "term://*",
    callback = function()
      if vim.fn.mode() == "n" then
        vim.cmd("startinsert")
      end
    end,
  })

  -- 🏆 Fix: Allow normal mode (`Ctrl-w`) without breaking auto-insert
  vim.api.nvim_create_autocmd("TermLeave", {
    pattern = "*",
    callback = function()
      vim.cmd("stopinsert") -- Exit insert mode when leaving the terminal
    end,
  })
end

