return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", 
    opts = require "configs.conform",
  },

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

  { import = "nvchad.blink.lazyspec" },
  
  {
    'nvim-telescope/telescope.nvim',
    enabled = false
  }
}
