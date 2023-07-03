local M = {}

local setup_opt = {
	ui = {
		border = "none",
	},
}

local plugins = {
	-- File explorer
  --[[
  {
    "noice.nvim",
    config = function()
      vim.keymap.set(
        "n",
        "<C-e>",
        function()
          local result = vim.treesitter.get_captures_at_cursor(0)
          vim.inspect(result)
        end,
        { noremap = true, silent = false }
      )
    end
  },
  ]]
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		config = require("core.plugins.neo-tree").setup,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"miversen33/netman.nvim",
		},
	},

	{
		"folke/which-key.nvim",
		config = require("core.plugins.which-key").setup,
	},

	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			require("catppuccin").setup({})
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},

	require("core.plugins.bufferAndNavigation").spec,
	require("core.plugins.treesitter").spec,
	require("core.plugins.cmp").spec,
	require("core.plugins.lsp").spec,
	require("core.plugins.telescope").spec,

  --[[
	{
		"echasnovski/mini.animate",
		config = function()
			require("mini.animate").setup()
		end,
	},
  --]]

	--[[
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false
			require("windows").setup({
				animation = {
					enable = false,
					easing = "in_out_sine",
				},
			})
		end,
	},
  --]]

	{
		"princejoogie/chafa.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"m00qek/baleia.nvim",
		},
		config = function()
			require("chafa").setup({
				render = {
					min_padding = 5,
					show_label = true,
				},
				events = {
					update_on_nvim_resize = true,
				},
			})
		end,
	},
	{ "equalsraf/neovim-gui-shim" },
  --[[
  {
    'mrcjkb/haskell-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim', -- optional
    },
    branch = '1.x.x', -- recommended
    config = function()
      require("core.plugins.haskell-tools").setup()
    end,
    ft = "haskell",
  },
  ]]
  
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        direction = "float",
      })
      vim.cmd([[
      autocmd TermEnter term://*toggleterm#* tnoremap <silent><c-\> <Cmd>exe v:count1 . "ToggleTerm"<CR>
        ]])

      vim.cmd([[
        nnoremap <silent><c-\> <Cmd>exe v:count1 . "ToggleTerm"<CR>
        inoremap <silent><c-\> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
      ]])
    end
  },

  --[[
  {
    "3rd/image.nvim",
    config = function()
      require("image").setup({
        backend = "ueberzug",
        integrations = {
          markdown = {
            enabled = true,
            sizing_strategy = "auto",
            download_remote_images = true,
            clear_in_insert_mode = false,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        kitty_method = "normal",
        kitty_tmux_write_delay = 5,
      })
    end,
  },
  ]]
}

M.setup = function()
	require("lazy").setup(plugins, setup_opt)
end

return M
