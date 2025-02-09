vim.opt.foldmethod = "expr" -- Use expressions for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use Treesitter to determine folds
vim.opt.foldenable = false -- Don't auto-collapse code on open
vim.opt.foldlevel = 99 -- Keep everything open by default

vim.opt.fillchars = { fold = " " } -- Remove ugly fold characters
--vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()" -- Use Treesitter fold text
vim.opt.foldtext = "v:lua.MyFoldText()" -- Set custom fold text function

function _G.MyFoldText()
  local line = vim.fn.getline(vim.v.foldstart) -- Get the first line of the fold
  local num_lines = vim.v.foldend - vim.v.foldstart + 1
  return " ⌄  " .. line .. "  (" .. num_lines .. " lines) "
end


