return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- Always get the latest version
    lazy = false,
    config = function()
      require("configs.toggleterm")() -- ✅ Correct way to call the module
    end,
  },
}

