local init = function()
	-- colorscheme for when settings do not load properly
	vim.cmd.colorscheme("slate")

	require("core.bootstrap").setup()
	require("core.keymaps").setup()
	require("core.options").setup()
	require("core.plugins").setup()
end

init()
