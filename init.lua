-- Icon configurations
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.opt.shortmess:append "csI"
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_health = 1
vim.g.loaded_healthcheck = 1

-- UI Icons configuration
vim.g.icons = {
  diagnostics = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  },
  git = {
    added = " ",
    modified = " ",
    removed = " ",
    branch = " ",
    unstaged = "★",
    staged = "✓",
    unmerged = "",
  },
  kinds = {
    Array = " ",
    Boolean = " ",
    Class = " ",
    Color = " ",
    Constant = " ",
    Constructor = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = " ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Namespace = " ",
    Null = " ",
    Number = " ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = " ",
  },
  ui = {
    Arrow = "→",
    BoldArrow = "➜",
    ChevronRight = "",
    Directory = "",
    File = "",
    LineLeft = "▏",
    LineMiddle = "│",
    Search = "",
    Selected = "❯",
    Lock = "",
    Circle = "",
    BigCircle = "",
    BigUnfilledCircle = "",
    Close = "",
    NewFile = "",
    Folder = "",
    FolderOpen = "",
    FolderEmpty = "",
    FolderEmptyOpen = "",
  }
}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)
vim.opt.shortmess:append("I")

-- Additional plugin specifications for icons
local plugins = {
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup {
        override = {
          default_icon = {
            icon = "",
            name = "Default",
          },
        },
        strict = true,
        override_by_extension = {
          ["lua"] = {
            icon = "",
            name = "Lua"
          },
          ["md"] = {
            icon = "",
            name = "Markdown"
          },
          ["json"] = {
            icon = "",
            name = "JSON"
          },
        },
      }
    end,
  },
}

-- Load core configurations
require("core.options")
require("core.autocmds")

-- Load lazy.nvim configuration with plugins
require("lazy").setup("plugins")

-- Load keymaps and set colorscheme after plugins are loaded
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    require("core.keymaps")
    require("core.colors")
  end,
})
