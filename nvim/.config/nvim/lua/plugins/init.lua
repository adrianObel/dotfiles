return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "python"
      },
    },
  },
 
  { 
    'nvim-mini/mini.ai',
    version = '*',
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup()
    end,
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
}
