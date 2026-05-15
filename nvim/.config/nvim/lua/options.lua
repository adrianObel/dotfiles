require "nvchad.options"

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Code folds
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99 -- open all folds by default
o.foldnestmax = 4 -- don't fold beyond 4 levels deep
o.foldenable = true
o.foldcolumn = "1"

vim.opt.fillchars = {
  fold = " ",
  foldopen  = "\u{F078}",  -- nf-fa-chevron_down
  foldclose = "\u{F054}",  -- nf-fa-chevron_right
  foldsep   = " ",
  diff      = "╱",
  eob       = " ",
}
