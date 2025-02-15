local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- ✅ Merge LSP capabilities with Copilot support
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Function to attach LSP keybindings when a language server is active
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- LSP Navigation
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)      -- Go to definition
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)      -- Find references
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)     -- Go to declaration
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)  -- Go to implementation
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)            -- Show documentation
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)  -- Rename variable

  -- Diagnostics navigation
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)  -- Previous diagnostic
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)  -- Next diagnostic

  -- ✅ Autoformat on save if LSP supports formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end

  -- ✅ Auto-fix imports on save
  if client.server_capabilities.codeActionProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action({
          context = { only = { "source.organizeImports" } },
          apply = true,
        })
      end,
    })
  end

  -- ✅ Ensure Copilot works properly with LSP
  if client.name == "copilot" then
    client.server_capabilities.documentFormattingProvider = false -- Disable LSP formatting for Copilot
  end
end

-- ✅ Configure `gopls` (Go Language Server)
lspconfig.gopls.setup({
  capabilities = capabilities, -- Ensure completion works with `gopls`
  on_attach = on_attach,
  settings = {
    gopls = {
      gofumpt = true, -- Enforce better formatting
      staticcheck = true, -- Enable static analysis
      analyses = {
        unusedparams = true,
        unusedvariable = true,
      },
    },
  },
})

-- ✅ Configure Copilot LSP (Ensures Copilot Doesn't Interfere With `gopls`)
lspconfig.copilot = {
  capabilities = capabilities, -- Ensure Copilot works alongside `gopls`
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false -- Prevent Copilot from overriding LSP formatting
  end,
}
