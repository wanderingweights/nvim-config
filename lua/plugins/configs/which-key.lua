local wk = require("which-key")

wk.setup {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
}

local normal_opts = {
  mode = "n",     -- Normal mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local visual_opts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local normal_mappings = {
  ["S"] = { "<cmd>lua require('spectre').toggle()<cr>", "Toggle Spectre" },
  ["a"] = { name = "+Avante" },
  ["as"] = { "<cmd>lua require('avante').submit()<cr>", "Submit" },
  ["at"] = { "<cmd>lua require('avante').toggle()<cr>", "Toggle" },
  ["b"] = { name = "+Buffer" },
  ["bb"] = { "<cmd>enew<cr>", "New buffer" },
  ["bd"] = { "<cmd>bdelete<cr>", "Delete buffer" },
  ["d"] = { name = "+Debug" },
  ["dO"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  ["db"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  ["dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  ["di"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
  ["dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
  ["do"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
  ["dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
  ["dt"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
  ["du"] = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
  ["f"] = { name = "+Find" },
  ["fP"] = { "<cmd>Telescope find_files cwd=~/.config/nvim/lua/plugins/<cr>", "Find Plugin Config" },
  ["fS"] = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
  ["fb"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
  ["fc"] = { "<cmd>Telescope commands<cr>", "Commands" },
  ["fd"] = { "<cmd>Telescope lsp_definitions<cr>", "Find Definitions" },
  ["fe"] = { "<cmd>Telescope file_browser<cr>", "File Browser" },
  ["ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["fg"] = { "<cmd>Telescope live_grep<cr>", "Grep (Fuzzy Finder)" },
  ["fi"] = { "<cmd>Telescope lsp_implementations<cr>", "Find Implementations" },
  ["fh"] = { function() require('telescope').extensions.harpoon.marks() end, "Show Harpoon marks in Telescope" },
  ["fk"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  ["fm"] = { "<cmd>Telescope media_files<cr>", "Media Files" },
  ["fn"] = { "<cmd>Telescope man_pages sections=1,3<cr>", "Man Pages" },
  ["fp"] = { "<cmd>Telescope projects<cr>", "Projects" },
  ["fr"] = { "<cmd>Telescope lsp_references<cr>", "Find References" },
  ["fs"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  ["g"] = { name = "+Git" },
  ["gc"] = { "<cmd>Git commit<cr>", "Git Commit" },
  ["gp"] = { "<cmd>Git push<cr>", "Git Push" },
  ["gs"] = { "<cmd>Git<cr>", "Git Status" },
  ["gw"] = { name = "+Git Worktree" },
  ["gwc"] = { "<cmd>lua require('git-worktree').create_worktree(vim.fn.input('Worktree name: '), vim.fn.input('Branch: '), vim.fn.input('Upstream: '))<cr>", "Create Worktree" },
  ["gws"] = { "<cmd>lua require('git-worktree').switch_worktree(vim.fn.input('Worktree name: '))<cr>", "Switch Worktree" },
  ["gwd"] = { "<cmd>lua require('git-worktree').delete_worktree(vim.fn.input('Worktree name: '))<cr>", "Delete Worktree" },
  ["l"] = { name = "+LSP" },
  ["lR"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  ["la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  ["ld"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition" },
  ["lf"] = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
  ["li"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation" },
  ["lk"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
  ["lr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
  ["nh"] = { "<cmd>nohlsearch<cr>", "Clear search highlights" },
  ["p"] = { name = "+Python" },
  ["pD"] = { "<cmd>DogeGenerate<cr>", "Generate Docstring" },
  ["pF"] = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format File" },
  ["pT"] = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest Test" },
  ["pc"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" },
  ["pd"] = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
  ["pf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File Tests" },
  ["pi"] = { "<cmd>!pip install -r requirements.txt<cr>", "Install Requirements" },
  ["pl"] = { "<cmd>lua require('lint').try_lint()<cr>", "Lint File" },
  ["pp"] = { "<cmd>Telescope projects<cr>", "List Projects" },
  ["pr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Symbol" },
  ["ps"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Toggle Test Summary" },
  ["pt"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" },
  ["pu"] = { "<cmd>!pip freeze > requirements.txt<cr>", "Update Requirements" },
  ["pv"] = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Pick Virtual Env" },
  ["sp"] = { "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>", "Search on current file" },
  ["sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search current word" },
  ["z"] = { "<cmd>botright split | resize 10% | terminal<cr>i", "Open terminal at bottom" },
}

local visual_mappings = {
  ["c"] = {
    name = "+Comment",
    ["c"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
    ["b"] = { "<Plug>(comment_toggle_blockwise_visual)", "Comment toggle blockwise (visual)" },
  },
}

-- Register the mappings
wk.register(normal_mappings, normal_opts)
wk.register(visual_mappings, visual_opts)
