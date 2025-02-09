return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false, -- 🚀 Ensure it's loaded at startup
    config = function()
      require("configs.treesitter")() -- ✅ Loads our Treesitter config
    end,
  },
}

