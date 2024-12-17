-- ~/.config/nvim/init.lua
--
vim.g.mapleader = " "

-- Load core configurations
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Bootstrap plugins
require("plugins")

-- ~/.config/nvim/lua/lsp/init.lua
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure diagnostic display
vim.diagnostic.config({
  float = {
    max_width = 60,    -- Maximum width of the floating window
    width = 60,        -- Fixed width of the floating window
    wrap = true,       -- Enable text wrapping
    max_height = 20,   -- Maximum height of the floating window
    source = 'always', -- Show source in diagnostic popup window
  }
})

-- Configure hover and signature help to also wrap
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    max_width = 60,
    width = 60,
    wrap = true,
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    max_width = 60,
    width = 60,
    wrap = true,
  }
)
local servers = { 'html', 'cssls', 'ts_ls', 'lua_ls', 'jsonls', 'bashls' }

local on_attach = function(client, bufnr)
  -- Keymaps for LSP
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Navigation
  vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = "Go to definition" }))
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = "List references" }))
  vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation,
    vim.tbl_extend('force', opts, { desc = "Go to implementation" }))
  vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition,
    vim.tbl_extend('force', opts, { desc = "Go to type definition" }))

  -- Actions
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = "Code actions" }))
  vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = "Rename symbol" }))
  vim.keymap.set('n', '<leader>lf', function()
    vim.lsp.buf.format({ async = true })
  end, vim.tbl_extend('force', opts, { desc = "Format code" }))
end

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
-- Setup ruff-lsp without explicit formatting rules
lspconfig.ruff_lsp.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  }
})
