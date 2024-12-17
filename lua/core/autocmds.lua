-- ~/.config/nvim/lua/core/autocmds.lua

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.foldmethod = "syntax"
  end
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.py" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})


-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
