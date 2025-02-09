-- 🔄 Auto-reload Neovim when saving this file
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "init.lua",
  command = "source <afile> | PackerCompile",
})

-- 🛠 Auto-format before saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- 🔥 Highlight text after yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

