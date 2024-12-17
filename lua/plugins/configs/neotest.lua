local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
      runner = "pytest",
    }),
    -- Add more adapters here for other languages if needed
  },
  icons = {
    failed = "✖",
    passed = "✔",
    running = "🗘",
    skipped = "ﰸ",
    unknown = "?",
  },
  summary = {
    enabled = true,
    expand_errors = true,
    follow = true,
    mappings = {
      attach = "a",
      clear_marked = "M",
      clear_target = "T",
      debug = "d",
      debug_marked = "D",
      expand = { "<CR>", "<2-LeftMouse>" },
      expand_all = "e",
      jumpto = "i",
      mark = "m",
      next_failed = "J",
      output = "o",
      prev_failed = "K",
      run = "r",
      run_marked = "R",
      short = "O",
      stop = "u",
      target = "t",
    },
  },
})

-- Keymappings
vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run current file" })
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle test summary" })
vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true }) end, { desc = "Show test output" })

