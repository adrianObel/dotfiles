-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "catppuccin-latte" },
  --
  hl_override = {
    NvimTreeNormal = {
      bg = "NONE",
    },
    NvimTreeNormalNC = {
      bg = "NONE",
    },
    NvimTreeEndOfBuffer = {
      bg = "NONE",
    },
    NvimTreeWinSeparator = {
      fg = "line",
      bg = "none",
    },
  },

  hl_add = {
    -- TelescopeNormal
    SnacksPicker               = { bg = "darker_black" },
    SnacksPickerList           = { bg = "darker_black" },
    SnacksPickerPreview        = { bg = "darker_black" },
    -- TelescopeBorder (borderless)
    SnacksPickerBorder         = { fg = "darker_black", bg = "darker_black" },
    SnacksPickerListBorder     = { fg = "darker_black", bg = "darker_black" },
    SnacksPickerPreviewBorder  = { fg = "darker_black", bg = "darker_black" },
    -- TelescopeResultsTitle (borderless)
    SnacksPickerListTitle      = { fg = "darker_black", bg = "darker_black" },
    -- TelescopeSelection
    SnacksPickerListCursorLine = { bg = "black2", fg = "white" },
    -- TelescopePromptNormal (borderless)
    SnacksPickerInput          = { fg = "white", bg = "black2" },
    -- TelescopePromptBorder (borderless)
    SnacksPickerInputBorder    = { fg = "black2", bg = "black2" },
    -- TelescopePromptTitle
    SnacksPickerInputTitle     = { fg = "black", bg = "red" },
    -- TelescopePromptPrefix
    SnacksPickerInputIcon      = { fg = "red", bg = "black2" },
    -- TelescopePreviewTitle
    SnacksPickerPreviewTitle   = { fg = "black", bg = "green" },
    -- TelescopeMatching
    SnacksPickerMatch          = { bg = "one_bg", fg = "blue" },
    -- TelescopeResultsDiff*
    SnacksDiffAdd              = { fg = "green" },
    SnacksDiffChange           = { fg = "yellow" },
    SnacksDiffDelete           = { fg = "red" },
  }
}

M.nvdash = {
  load_on_startup = true,
  buttons = {
    { txt = "  Find File", keys = "ff", cmd = ":lua require('snacks').picker.files()" },
    { txt = "  Recent Files", keys = "fo", cmd = ":lua require('snacks').picker.recent()" },
    { txt = "󰈭  Live Grep", keys = "sg", cmd = ":lua require('snacks').picker.grep()" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

M.ui = {
  statusline = {
    theme = "minimal",
  },
  --       tabufline = {
  --          lazyload = false
  --      }
}

return M
