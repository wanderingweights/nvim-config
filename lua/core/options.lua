-- ~/.config/nvim/lua/core/options.lua

-- General Neovim settings
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 10
vim.opt.foldenable = false
vim.opt.foldlevel = 2
vim.opt.showmatch = true      -- Show matching brackets
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.shiftwidth = 2        -- Size of an indent
vim.opt.tabstop = 2           -- Number of spaces tabs count for
vim.opt.smartindent = true    -- Autoindent new lines
vim.opt.wrap = false          -- Disable line wrapping
vim.opt.swapfile = false      -- Don't use swapfile
vim.opt.backup = false        -- Don't create backup files
vim.opt.undofile = true       -- Save undo history
vim.opt.hlsearch = false      -- Disable search highlight
vim.opt.incsearch = true      -- Incremental search
vim.opt.termguicolors = true
vim.opt.syntax = "on"
vim.opt.background = "dark"       -- or "light" if you prefer
vim.opt.scrolloff = 8             -- Lines of conte xt
vim.opt.sidescrolloff = 8         -- Columns of context
vim.opt.updatetime = 50           -- Faster completion
vim.opt.clipboard = "unnamedplus" -- System clipboard
vim.opt.cursorline = true         -- Highlight the current line
vim.opt.signcolumn = "yes"        -- Always show the signcolumn
vim.opt.colorcolumn = ""          -- Line length marker at 80 columns
vim.opt.list = true               -- Show some invisible characters (tabs...)
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.mouse = "a"

vim.cmd('filetype plugin indent on')
