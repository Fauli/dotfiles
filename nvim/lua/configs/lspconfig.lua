local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Enable autocompletion capabilities for LSP
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

  -- Autoformat on save if the language server supports formatting
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

end

-- Configure gopls for Go development with autocompletion
lspconfig.gopls.setup({
  capabilities = capabilities, -- Enable LSP autocompletion
  on_attach = on_attach,
  settings = {
    gopls = {
      gofumpt = true,    -- Use gofumpt for formatting
      staticcheck = true, -- Enable extra linting checks
      analyses = {
        unusedparams = true,  -- Highlight unused function parameters
        unusedvariable = true, -- Highlight unused variables
      },
    },
  },
})

vim.fn.sign_define("DiagnosticSignError", { text = "🔥", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",  { text = "⚠️", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint",  { text = "💡", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo",  { text = "ℹ️", texthl = "DiagnosticSignInfo" })

vim.lsp.inlay_hint.enable(true)


-- Enable LSP for other languages (optional)
-- Uncomment these if you want support for other languages
-- lspconfig.lua_ls.setup({ on_attach = on_attach, capabilities = capabilities })  -- Lua
-- lspconfig.tsserver.setup({ on_attach = on_attach, capabilities = capabilities })  -- TypeScript
-- lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })  -- Python

