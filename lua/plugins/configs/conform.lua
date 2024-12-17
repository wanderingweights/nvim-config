-- ~/.config/nvim/lua/plugins/configs/conform.lua
require('conform').setup {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    python = { "black" },
    rust = { "rustfmt" },
  },
  format_on_save = false,
  format_after_save = false,
  notify_on_error = true,
  log_level = vim.log.levels.ERROR,
}

-- Add a keybinding to manually trigger formatting
vim.keymap.set('n', '<leader>f', function()
  require('conform').format({ async = true, lsp_fallback = true })
end, { desc = 'Format buffer' })
