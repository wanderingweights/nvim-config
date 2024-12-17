local lint = require('lint')

lint.linters_by_ft = {
  python = {'pylint',},
  -- Add more file types and linters as needed
}

-- Create an autocommand to trigger linting
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})

