-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin-latte",
  theme_toggle = { "catppuccin", "catppuccin-latte" },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
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

-- Update Snacks picker to match NVChad theme
local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
local bg_alt = vim.api.nvim_get_hl(0, { name = "Visual" }).bg

vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = bg_alt, bg = bg })
vim.api.nvim_set_hl(0, "SnacksPickerPreviewBorder", { fg = bg, bg = bg })
vim.api.nvim_set_hl(0, "SnacksPickerInputBorder", { fg = bg, bg = bg })
vim.api.nvim_set_hl(0, "SnacksPickerListBorder", { fg = bg, bg = bg })

return M
