local M = {}

M.setup = function()
  require("scrollbar").setup({
    handlers = {
      diagnostic = true,
      search = true,
      gitsigns = true,
    },
  })
  require("scrollbar.handlers.gitsigns").setup()
end

return M
