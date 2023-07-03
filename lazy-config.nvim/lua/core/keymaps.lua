local util = require("util")

local M = {}

local mappings = {
	insert = {
		-- escape insert mode
		["kj"] = { "<ESC>" },
		["jj"] = { "<ESC>" },
		["jk"] = { "<ESC>" },
		["fd"] = { "<ESC>" },
	},
	normal = {
		-- write and quit
		["<Leader>w<CR>"] = { ":w<CR>", { desc = "Save file" } },
		["<Leader>q<CR>"] = { ":q<CR>", { desc = "Quit" } },
		-- window
		["sh"] = { "<C-w>h", { desc = "Go to left window" } },
		["sj"] = { "<C-w>j", { desc = "Go to bottom window" } },
		["sk"] = { "<C-w>k", { desc = "Go to above window" } },
		["sl"] = { "<C-w>l", { desc = "Go to right window" } },
		["sv"] = { "<C-w>v", { desc = "Split window vertically" } },
		["ss"] = { "<C-w>s", { desc = "Split window horizontal" } },
		-- tab
		["<Leader>tn"] = { ":tabnew<CR>", { desc = "Create new tab" } },
		["<Leader>th"] = { ":tabNext<CR>", { desc = "Move to next tab" } },
		["<Leader>tl"] = { ":tabnext<CR>", { desc = "Move to previows tab" } },
		-- terminal
		["<Leader>'"] = { ":terminal<CR>", { desc = "Open terminal" } },
    ["L"] = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { desc = "Popup error" } },
    -- exproler
    -- ["<Leader>e"] = { ":e .<CR>" }
	},
	terminal = {
		-- escape terminal mode
		["kj"] = { "<C-\\><C-n>" },
		["jj"] = { "<C-\\><C-n>" },
		["jk"] = { "<C-\\><C-n>" },
		["fd"] = { "<C-\\><C-n>" },
	},
	visual = {
		["<"] = { "<gv" },
		[">"] = { ">gv" },
	},
}

M.setup = function()
	vim.g.mapleader = " "
	util.set_keymaps("i", mappings.insert)
	util.set_keymaps("n", mappings.normal)
	util.set_keymaps("t", mappings.terminal)
	util.set_keymaps("v", mappings.visual)
end

return M
