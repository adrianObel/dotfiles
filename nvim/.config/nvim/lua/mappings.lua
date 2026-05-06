require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del
 
map("n", ";", ":", { desc = "cmd enter command mode" })
map("i", "jk", "<ESC>")

-- Remove Telescope bindings
local telescope_maps = {
  "<leader>fw", -- telescope live grep
  "<leader>fa", -- telescope find all files
  "<leader>fh", -- telescope help page
  "<leader>fo", -- telescope find oldfiles
  "<leader>fz", -- telescope find in current buffer
  "<leader>cm", -- telescope find commits,
  "<leader>gt", -- telescope git status 
  "<leader>ma", -- telescope find marks
  "<leader>pt", -- telescope pick hidden terms
}

for _, key in ipairs(telescope_maps) do
  pcall(del, "n", key) -- pcall so a missing map doesn't abort startup
end

-- Snacks --
map("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "smart find files" })
map("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "command history" })
map("n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "notification history" })
-- find
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "find buffers" })
map("n", "<leader>fc", function()
    Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
  end,
  { desc = "find config file" }
)
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "find files" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "find recent" })
-- git
map("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "git branches" })
map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "git log" })
map("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "git log line" })
map("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "git status" })
map("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "git stash" }) 
map("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "git diff" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "git log file" })
-- search
map("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "grep" })
map("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "buffer lines" })
map("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "grep open buffers" })
map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })
map("n", '<leader>s"', function() Snacks.picker.registers() end, { desc = "registers" })
map("n", '<leader>s/', function() Snacks.picker.search_history() end, { desc = "search history" })
map("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "autocmds" })
map("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "buffer lines" })
map("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "command history" })
map("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "commands" })
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "diagnostics" })
map("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "buffer diagnostics" })
map("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "help pages" })
map("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "highlights" })
map("n", "<leader>si", function() Snacks.picker.icons() end, { desc = "icons" })
map("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "jumps" })
map("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "keymaps" })
map("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "location list" })
map("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "marks" })
map("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "man pages" })
map("n", "<leader>sp", function() Snacks.picker.lazy() end, { desc = "search for plugin spec" })
map("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "quickfix list" })
map("n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "resume" })
map("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "undo history" })
-- LSP
map("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "goto definition" })
map("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "goto declaration" })
map("n", "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "references" })
map("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "goto implementation" })
map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "goto t[y]pe definition" })
map("n", "gai", function() Snacks.picker.lsp_incoming_calls() end, { desc = "c[a]lls incoming" })
map("n", "gao", function() Snacks.picker.lsp_outgoing_calls() end, { desc = "c[a]lls outgoing" })
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP symbols" })
map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP workspace symbols" })
