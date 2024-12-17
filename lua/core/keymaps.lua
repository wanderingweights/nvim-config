-- ~/.config/nvim/lua/core/keymaps.lua

-- Declare vim as a global variable
---@diagnostic disable-next-line: undefined-global
vim = vim

-- Set up statusline
vim.opt.statusline = [[ %f %m %= %l:%c %p%% ]]

local opts = { noremap = true, silent = true }

-- nvim-tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle NvimTree" })

vim.keymap.set('n', 'ha', function() require('harpoon.mark').add_file() end,
  { noremap = true, silent = true, desc = "Add file to Harpoon" })
vim.keymap.set('n', 'hn', function() require('harpoon.ui').nav_next() end,
  { noremap = true, silent = true, desc = "Go to next Harpoon mark" })
vim.keymap.set('n', 'hp', function() require('harpoon.ui').nav_prev() end,
  { noremap = true, silent = true, desc = "Go to previous Harpoon mark" })
vim.keymap.set('n', 'hq', function() require('harpoon.mark').rm_file() end,
  { noremap = true, silent = true, desc = "Remove file from Harpoon" })
-- General Keymaps
vim.keymap.set('n', '<leader>nh', ':nohlsearch<CR>', { noremap = true, silent = true, desc = "Clear search highlights" })
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, silent = true, desc = "Exit insert mode" })
--
-- Custom function to hover at cursor position
local function hover_at_cursor()
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local col = vim.api.nvim_win_get_cursor(0)[2]
  vim.lsp.buf.hover({ offset_encoding = "utf-16", pos = { line, col } })
end

-- Define bufopts
local bufopts = { noremap = true, silent = true, buffer = 0 }

-- Map 'K' to hover at cursor position
vim.keymap.set('n', 'gk', hover_at_cursor, { noremap = true, silent = true, desc = "more info" })
vim.keymap.set('n', 'gbp', ':bprevious<CR>', { noremap = true, silent = true, desc = "Go to previous buffer" })
vim.keymap.set('n', 'gbn', ':bnext<CR>', { noremap = true, silent = true, desc = "Go to next buffer" })
vim.keymap.set('n', 'gbq', ':bdelete<CR>', { noremap = true, silent = true, desc = "Delete current buffer" })

vim.keymap.set('n', 'gb', '<C-o>', { noremap = true, silent = true, desc = "Jump back to previous location" })
vim.keymap.set('n', 'gf', '<C-i>', { noremap = true, silent = true, desc = "Jump forward to next location" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true, desc = "Show references" })
vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, { noremap = true, silent = true, desc = "Go to type definition" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, silent = true, desc = "Go to implementation" })
vim.keymap.set('n', 'gs', ':split<CR>', { noremap = true, silent = true, desc = "Horizontal split" })
vim.keymap.set('n', 'gv', ':vsplit<CR>', { noremap = true, silent = true, desc = "Vertical split" })
vim.keymap.set('n', 'gtt', ':tabnew<CR>', { noremap = true, silent = true, desc = "Open a new tab" })
vim.keymap.set('n', 'gtp', ':tabprevious<CR>', { noremap = true, silent = true, desc = "Go to previous tab" })
vim.keymap.set('n', 'gtn', ':tabnext<CR>', { noremap = true, silent = true, desc = "Go to next tab" })
vim.keymap.set('n', 'gtq', ':tabclose<CR>', { noremap = true, silent = true, desc = 'Close current tab' })



vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { noremap = true, silent = true, desc = "Show signature help" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Rename symbol" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code action" })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Show diagnostics" })
--
-- Window Navigation (Use Ctrl + h/j/k/l to move between windows)
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = "Move to left window" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = "Move to bottom window" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = "Move to top window" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = "Move to right window" })

-- Terminal Mode Escape
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })

-- Open terminal at the bottom (10% height) and enter insert mode
vim.keymap.set('n', '<leader>z', ':botright split | resize 10% | terminal<CR>i',
  { noremap = true, silent = true, desc = "Open terminal at bottom" })

-- Spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
  noremap = true, silent = true, desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  noremap = true, silent = true, desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  noremap = true, silent = true, desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  noremap = true, silent = true, desc = "Search on current file"
})

vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float,
  vim.tbl_extend('force', opts, { desc = "Show diagnostic in float" }))

-- Oil.nvim setup
-- Use '-' to open Oil (file explorer) in the current directory
-- In Oil: <CR> to open a file/directory, '-' to go up a directory
-- :edit <path> or :Oil <path> to open a specific directory
-- :Oil --float <path> to open in a floating window
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory with Oil" })
