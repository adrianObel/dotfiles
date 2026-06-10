return {
  {
    "nvim-mini/mini.ai",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup()
    end,
  },

  {
    "nvim-mini/mini.surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup()
    end,
  },
}
