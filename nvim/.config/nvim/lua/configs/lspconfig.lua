require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("pyright", {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
})

local servers = { "html", "cssls", "basedpyright", "vtsls", "prettier", "eslint-lsp", "toml" }
vim.lsp.enable(servers)

vim.lsp.inlay_hint.enable()
-- read :h vim.lsp.config for changing options of lsp servers
