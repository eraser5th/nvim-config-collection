local M = {}

-- local pathOfThisDir = (...):match("(.-)[^%.]+$") -- returns 'path.of.this.dir.'
-- ↑ これは、init.lua以外でのものっぽい。

local pwd = ...

M.spec = {
  {
    "lewis6991/gitsigns.nvim",
    config = require(pwd .. ".gitsigns").setup,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = require(pwd .. ".lualine").setup,
  },
  {
    "akinsho/bufferline.nvim",
    version = "v4.2.0",
    config = require(pwd .. ".bufferline").setup,
  },
  "famiu/bufdelete.nvim",
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({ show_current_context = true })
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = require(pwd .. ".nvim-hlslens").setup,
  },
  {
    "petertriho/nvim-scrollbar",
    config = require(pwd .. ".nvim-scrollbar").setup,
  },
  {
    "yamatsum/nvim-cursorline",
    config = require(pwd .. ".nvim-cursorline").setup,
    dependencies = {
      "lewis6991/gitsigns.nvim"
    },
  },
  "brenoprata10/nvim-highlight-colors",
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup()
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("git-conflict").setup()
    end,
  },
}

return M
