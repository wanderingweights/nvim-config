-- ~/.config/nvim/lua/plugins/configs/telescope.lua
local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local fb_actions = require('telescope').extensions.file_browser.actions

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules", "%.lock", "%.sqlite3", "%.svg", "%.otf", "%.ttf" },
    layout_config = {
      horizontal = {
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    sorting_strategy = "ascending",
    winblend = 10,
    border = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    live_grep = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
    project = {
      base_dirs = {
        { '~/dev', max_depth = 4 },
      },
      hidden_files = true,
      theme = "dropdown",
    },
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg"
    },
  },
}

telescope.load_extension('media_files')

-- Custom highlights
vim.cmd([[
  highlight TelescopeBorder guifg=#4c4c4c
  highlight TelescopePromptBorder guifg=#4c4c4c
  highlight TelescopeResultsBorder guifg=#4c4c4c
  highlight TelescopePreviewBorder guifg=#4c4c4c
  highlight TelescopeSelectionCaret guifg=#cc241d
  highlight TelescopeSelection guifg=#d79921 gui=bold
  highlight TelescopeMultiSelection guifg=#928374
  highlight TelescopeNormal guibg=#00000000
]])

-- Custom theme
local custom_theme = require('telescope.themes').get_dropdown({
  borderchars = {
    { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    prompt = { "─", "│", " ", "│", '╭', '╮', "│", "│" },
    results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
    preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
  },
  width = 0.8,
  previewer = false,
  prompt_title = false,
  results_title = false,
  layout_config = {
    prompt_position = "top",
  },
})

-- Apply custom theme to pickers
local apply_theme = function(picker)
  return function(opts)
    opts = opts or {}
    return picker(vim.tbl_deep_extend("force", custom_theme, opts))
  end
end

-- Override default pickers with custom theme
builtin.find_files = apply_theme(builtin.find_files)
builtin.live_grep = apply_theme(builtin.live_grep)
builtin.buffers = apply_theme(builtin.buffers)

-- Additional keymaps for extensions
vim.keymap.set('n', '<leader>fp', telescope.extensions.project.project, { desc = "Projects" })
vim.keymap.set('n', '<leader>fm', telescope.extensions.media_files.media_files, { desc = "Media files" })
vim.keymap.set('n', '<leader>fe', telescope.extensions.file_browser.file_browser, { desc = "File browser" })
-- Additional keymaps for extensions
vim.keymap.set('n', '<leader>fp', telescope.extensions.project.project, { desc = "Projects" })
vim.keymap.set('n', '<leader>fm', telescope.extensions.media_files.media_files, { desc = "Media files" })
vim.keymap.set('n', '<leader>fe', telescope.extensions.file_browser.file_browser, { desc = "File browser" })

-- Additional useful keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = "Old files" })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Grep string" })
