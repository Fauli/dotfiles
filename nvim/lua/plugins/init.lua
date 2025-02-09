return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    priority = 1000,
    config = function()
      require("configs.lspconfig") 
    end,
  },
   {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("configs.toggleterm")()
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("configs.nvimtree")()
    end,
  },
}

