local M = {}

local pwd = ...

M.spec = {
  {
    "nvim-treesitter/nvim-treesitter",
    config = require(pwd .. ".nvim-treesitter").setup
  },
	"windwp/nvim-ts-autotag",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"p00f/nvim-ts-rainbow",
	"windwp/nvim-autopairs",
}

return M
