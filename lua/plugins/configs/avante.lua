-- ~/.config/nvim/lua/plugins/configs/avante.lua

require("avante").setup {
  provider = "claude",
  auto_suggestions_provider = "copilot",

  claude_fast = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-5-haiku-20241022",
    temperature = 0.2,
    max_tokens = 2000,
  },
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-5-sonnet-20241022",
    temperature = 0.2,
    max_tokens = 8000,
  },

  copilot = {
    endpoint = "https://api.githubcopilot.com",
    model = 'gpt-4o-mini',
    max_tokens = 2048,
    temperature = 0.4,
  },
  behaviour = {
    auto_suggestions = false,
    auto_apply_diff_after_generation = false,
  },
  mappings = {
    jump = {
      next = "]]",
      prev = "[[",
    },
    submit = {
      normal = "<leader>as", -- Submit in normal mode
      insert = "<C-s>",      -- Submit in insert mode
    },
    sidebar = {
      apply_all = "A",
      apply_cursor = "a",
      switch_windows = "<Tab>",
      reverse_switch_windows = "<S-Tab>",
    },
  },
  windows = {
    position = "right",
    wrap = true,
    width = 50,
    sidebar_header = {
      align = "center",
      rounded = true,
    },
  },
}
require("avante_lib").load()
