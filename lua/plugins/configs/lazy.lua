-- ~/.config/nvim/lua/plugins/configs/lazy.lua

local M = {
  defaults = {
    lazy = false, -- Default to not lazy-loading plugins
  },
  performance = {
    rtp = {
      -- Disable default plugins you don't use (speeds up loading)
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

return M

