return {

  "nvim-tree/nvim-tree.lua",
  enabled = true,
  config = function()
    local config = {
      view = {
        adaptive_size = false,
        width = function()
          return math.floor(vim.opt.columns:get() * 0.20)
        end,
      },
      renderer = {
        group_empty = true,
        root_folder_label = " ",
        indent_width = 1,
        indent_markers = {
          enable = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            none = " ",
          },
        },
        icons = {
          padding = " ",
          show = {
            file = true,
            folder = false,
            folder_arrow = true,
            git = true,
          },
        },
      },

      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },
    }
    require("nvim-tree").setup(config)
  end,
}
