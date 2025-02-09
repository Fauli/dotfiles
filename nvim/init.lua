vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- Load plugins using Lazy.nvim
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" }, -- Ensure this loads `lua/plugins/`
}, lazy_config)

-- Load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

-- Load core configurations
require "options"      -- Neovim settings (tab size, line numbers, etc.)
require "mappings"     -- Keybindings
require "autocmds"     -- Autocommands

vim.schedule(function()
  require "mappings"
end)


-- force open nvim-tree on startup
vim.schedule(function()
  require("nvim-tree.api").tree.open()
end)
