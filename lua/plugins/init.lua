return {
  {
    'romgrk/todoist.nvim'
  },
  {
    "anuvyklack/pretty-fold.nvim"
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  { 'ThePrimeagen/git-worktree.nvim' },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  --
  { "tris203/precognition.nvim" },
  -- quick fix
  { 'kevinhwang91/nvim-bqf' },
  --
  {
    'ryanoasis/vim-devicons'
  },
  -- Welcome display
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  -- Plugin Manager
  { 'folke/lazy.nvim' },
  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  -- catppuccin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- Ray
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-project.nvim',
      'nvim-telescope/telescope-media-files.nvim',
    },
    config = function()
      require('plugins.configs.telescope')
    end,
  },

  -- LSP Config
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      require('lsp')
    end,
  },

  -- Conform (Formatter)
  {
    'stevearc/conform.nvim',
    config = function()
      require('plugins.configs.conform')
    end,
  },

  -- Git Integration
  {
    'tpope/vim-fugitive',
  },

  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot"):setup({})
    end,
  },

  -- Mason (LSP Server Manager)
  {
    'williamboman/mason.nvim',
    config = function()
      require('plugins.configs.mason')
    end,
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  },
  -- Avante Plugin
  {
    "yetone/avante.nvim",
    version = false, -- Always use the latest version
    lazy = false,
    config = function()
      require("plugins.configs.avante")
    end,
    build = "make", -- Build step required by avante.nvim
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua",
      "stevearc/dressing.nvim",
      {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
      },
      -- Optional dependencies
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        config = function()
          require("img-clip").setup {
            -- Recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              use_absolute_path = false, -- For Windows users
            },
          }
        end,
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "Avante" },
        config = function()
          require("render-markdown").setup {
            file_types = { "markdown", "Avante" },
          }
        end,
      },
    },
  },


  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.configs.nvim-tree")
    end,
  },


  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require('plugins.configs.cmp')
    end,
  },

  -- LuaSnip
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Use the latest version
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "python" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },

  -- Git signs
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },

  -- Which-key for keybinding hints
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require("plugins.configs.which-key")
    end,
  },


  { "echasnovski/mini.nvim",       version = false },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("plugins.configs.dap")
    end
  },
  {
    "raimon49/requirements.txt.vim",
    ft = "requirements"
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require("plugins.configs.neotest")
    end
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("plugins.configs.nvim-lint")
    end
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end
  },
  {
    "vim-python/python-syntax",
    config = function()
      vim.g.python_highlight_all = 1
    end
  },
  -- Gruvbox colorscheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard", -- can be "soft", "medium", or "hard"
        palette_overrides = {
          -- Customize colors if needed
        },
        overrides = {
          -- Customize highlight groups if needed
        },
      })
      vim.cmd.colorscheme "gruvbox"
    end
  },
  {
    "nvim-pack/nvim-spectre",
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  { "rafamadriz/friendly-snippets" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'numToStr/Comment.nvim' },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  { 'nvim-lua/plenary.nvim' },
  { 'ThePrimeagen/harpoon' } }
