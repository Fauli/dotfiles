return function()
  require("nvim-tree").setup({
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  })

  -- 🚀 Ensure `nvim-tree` stays open
  vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
      local nvim_tree_wins = 0
      for _, win in pairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), "filetype") == "NvimTree" then
          nvim_tree_wins = nvim_tree_wins + 1
        end
      end
      if nvim_tree_wins == 0 then
        require("nvim-tree.api").tree.open()
      end
    end,
  })
end

