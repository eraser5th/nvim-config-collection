local M = {}

M.setup = function()
	require("nvim-cursorline").setup({
		cursorline = {
			enable = true,
			timeout = 300,
		},
		cursorword = {
			enable = true,
		},
	})
end

return M
