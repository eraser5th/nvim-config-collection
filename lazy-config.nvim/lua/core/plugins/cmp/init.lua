local M = {}

local pwd = ...

M.spec = {
  {
    "hrsh7th/nvim-cmp",
    config = require(pwd .. ".nvim-cmp").setup
  },
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"onsails/lspkind.nvim",
}

return M
