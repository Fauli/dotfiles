# Dotfiles

## General Installation

To setup the config, run `install.sh`.

## My Neo-Vim Journey

### Neovim Directory Structure: Where to Put Things

| **Type**                     | **Where to Put It**         | **Example File**                                 |
|------------------------------|----------------------------|-------------------------------------------------|
| **Neovim Startup Config**    | `init.lua`                 | `~/.config/nvim/init.lua`                       |
| **Core Settings (tabs, numbers, etc.)** | `lua/options.lua` | `~/.config/nvim/lua/options.lua`               |
| **Keybindings**              | `lua/mappings.lua`         | `~/.config/nvim/lua/mappings.lua`               |
| **Auto-Commands**            | `lua/autocmds.lua`         | `~/.config/nvim/lua/autocmds.lua`               |
| **Plugin List (Lazy.nvim)**  | `lua/plugins/`             | `~/.config/nvim/lua/plugins/init.lua`          |
| **Plugin Configurations**    | `lua/configs/`             | `~/.config/nvim/lua/configs/lspconfig.lua`     |
| **Post-Plugin Configs**      | `after/plugin/`            | `~/.config/nvim/after/plugin/lualine.lua`      |
| **Code Snippets**            | `snippets/`                | `~/.config/nvim/snippets/go.lua`               |



## Config files
- **`init.lua`** → Entry point that loads everything.
- **`lua/options.lua`** → Core Neovim settings.
- **`lua/mappings.lua`** → Custom keybindings.
- **`lua/autocmds.lua`** → Automate actions (e.g., auto-save).
- **`lua/plugins/init.lua`** → Plugin list for Lazy.nvim.
- **`lua/configs/`** → Configuration for individual plugins.
- **`after/plugin/`** → Extra plugin setup after Lazy.nvim loads.
- **`snippets/`** → Custom snippets (for LuaSnip).

✅ **Everything is modular, clean, and scalable!**

