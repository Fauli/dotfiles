return {
  {
     "github/copilot.vim",
     lazy = false, -- Ensures Copilot loads at startup
     config = function()
       vim.g.copilot_no_tab_map = true -- Prevent conflicts with nvim-cmp
       vim.g.copilot_enabled = true
     end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "github/copilot.vim" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
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

