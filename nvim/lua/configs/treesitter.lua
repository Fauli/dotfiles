return function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "go", "python", "javascript", "json", "rust", "toml" }, -- Add more languages as needed
    highlight = { enable = true },  -- Enable syntax highlighting
    indent = { enable = true }, -- Better indentation
    fold = { enable = true }, -- Enable Treesitter folding
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>v",
        node_incremental = "<leader>+",
        node_decremental = "<leader>-",
      },
    },
  })
end

