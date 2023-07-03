local M = {}

M.setup = function()
  local bufferline = require("bufferline")
  bufferline.setup({
    options = {
      mode = "tabs", -- or buffers
      -- style_preset = bufferline.style_preset.default, -- or minimal
      themable = true,
      numbers = "none",
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = "",
      indicator = {
        -- icon = '▎',
        style = 'underline', -- or 'icon' | 'none'
      },
      buffer_close_icon = '󰅖',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      --[[
      name_formatter = function(buf)  -- buf contains:
        -- name                | str        | the basename of the active file
        -- path                | str        | the full path of the active file
        -- bufnr (buffer only) | int        | the number of the active buffer
        -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
        -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
      end,
      ]]
      max_name_length = 18,
      max_prefix_length = 15,
      truncate_names = true,
      tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count..")"
      end,

      -- custom_filter = function(buf_number, buf_numbers) end,
      color_icons = true,
      --[[
      get_element_icon = function(element)
        local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
        return icon, hl
      end,
      ]]
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      persist_buffer_sort = true,
      move_wraps_at_ends = false,
      separator_style = "slant", -- | "slope" | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      },
      sort_by = 'tabs',
    }
  })
end

return M
