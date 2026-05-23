local options = {
  explorer = {
    enabled = false,
  },
  picker = {
    enabled = true,
    layout = {
      preset = "vscode",
      layout = {
        border = "rounded",
      },
    },
    prompt = "   ",
    sources = {
      files = { hidden = true, ignored = false },
      grep = { hidden = true, ignored = false },
      explorer = {
        layout = {
          preview = "main"
        }
      }
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
