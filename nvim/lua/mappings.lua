-- Load NvChad default mappings
require "nvchad.mappings"

-- Alias for shorter mappings
local map = vim.keymap.set

-- 🏆 Cleaner, modern keybindings (Recommended)
map("n", ";", ":", { desc = "CMD enter command mode" })  -- Press ';' to enter command mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })  -- jk to escape insert mode

-- 🔥 Save file using Ctrl+S in normal, insert, and visual mode
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { silent = true, desc = "Save file" })

-- 🔥 Git keybindings
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { silent = true, desc = "Git Blame" })

-- 🔥 ToggleTerm Keybindings
map("n", "<leader>to", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true, desc = "Open Floating Terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { noremap = true, silent = true, desc = "Open Vertical Terminal" })
map("n", "<leader>th", function()
  vim.cmd("ToggleTerm direction=horizontal")
end, { noremap = true, silent = true, desc = "Open Terminal (Horizontal)" })
map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", { noremap = true, silent = true, desc = "Open Tab Terminal" })

-- 🔥 Window Navigation
map("n", "<leader><Tab>", "<C-w>w", { silent = true, desc = "Switch Window Focus" })


-- 🔥 Undo list
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { silent = true, desc = "Undo Tree" })


-- Terminal config
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })


vim.g.copilot_no_tab_map = true  -- Disable Copilot's default Tab behavior

--map("i", "<C-j>", 'copilot#Accept("\\<CR>")', { expr = true, noremap = true, silent = true })
--map("i", "<C-]>", 'copilot#Next()', { silent = true, expr = true })
--map("i", "<C-[>", 'copilot#Previous()', { silent = true, expr = true })
--map("i", "<C-e>", 'copilot#Dismiss()', { silent = true, expr = true })

vim.api.nvim_set_keymap("i", "<C-J>", 'v:lua.M_CopilotAccept()', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Suggest()', { noremap = true, expr = true, silent = true })

function _G.M_CopilotAccept()
  local suggestion = vim.fn["copilot#Accept"]("")
  if suggestion ~= "" then
    return suggestion
  else
    return vim.api.nvim_replace_termcodes("<C-J>", true, true, true) -- Preserve normal <C-J> behavior if Copilot has no suggestion
  end
end
