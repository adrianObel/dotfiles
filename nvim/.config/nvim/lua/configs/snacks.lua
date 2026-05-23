local options = {
  explorer = {
    enabled = true,
  },
  picker = {
    enabled = true,
    layout = {
      preset = "telescope",
      -- Override to tighten up for NvChad's denser UI feel
      layout = {
        backdrop = 60,
        width = 0.85,
        height = 0.80,
        min_width = 80,
        min_height = 30,
        box = "horizontal",
        border = "rounded",
        title = "{title} {live} {flags}",
        title_pos = "center",
        {
          box = "vertical",
          border = "none",
          title = "{input}",
          { win = "input", height = 1, border = "bottom" },
          { win = "list", border = "none" },
        },
        {
          win = "preview",
          title = "{preview}",
          border = "rounded",
          width = 0.5,
        },
      },
    },
    sources = {
      files = { hidden = true, ignored = false },
      grep = { hidden = true, ignored = false },
    },
    -- Keymaps *inside* the picker window (mirrors Telescope defaults)
    win = {
      input = {
        keys = {
          ["<C-j>"] = { "list_down", mode = { "i", "n" } },
          ["<C-k>"] = { "list_up", mode = { "i", "n" } },
          ["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
          ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
          ["<C-x>"] = { "edit_split", mode = { "i", "n" } },
          ["<C-v>"] = { "edit_vsplit", mode = { "i", "n" } },
          ["<C-t>"] = { "edit_tab", mode = { "i", "n" } },
          ["<C-q>"] = { "qflist", mode = { "i", "n" } },
          ["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
          ["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
        },
      },
    },
  },
  notifier = { enabled = true },
  dashboard = { enabled = false },
  bigfile = { enabled = true },
  quickfile = { enabled = true },
  statuscolumn = { enabled = false },
  words = { enabled = true },
  scroll = { enabled = true },
  indent = { enabled = true },
  input = { enabled = false },
  scope = { enabled = true },
  zen = { enabled = false },
  terminal = { enabled = false },
  lazygit = { enabled = false },
  gitbrowse = { enabled = true },
}

return options
