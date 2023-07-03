local M = {}

M.setup = function()
  require("netman").setup()

	require("neo-tree").setup({
		sources = {
			"filesystem", -- Neotree filesystem source
      "git_status",
			"netman.ui.neo-tree", -- The one you really care about 😉
		},
		close_if_last_window = true,
		hide_root_node = false,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		window = {
			position = "float",
			width = 30,
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
				["o"] = "open",
			},
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_pattern = {
					".DS_Store",
				},
				never_show = {
					".DS_Store",
				},
			},
			follow_current_file = true,
			use_libuv_file_watcher = true,
			window = {
				mappings = {
					["<bs>"] = "navigate_up",
					["."] = "set_root",
					["/"] = "fuzzy_finder",
					["D"] = "fuzzy_finder_directory",
					["f"] = "filter_on_submit",
					["<c-x>"] = "clear_filter",
					["[g"] = "prev_git_modified",
					["]g"] = "next_git_modified",
				},
			},
		},
		source_selector = {
      winbar = true,
		},
		buffers = {
			follow_current_file = true, -- This will find and focus the file in the active buffer every
			group_empty_dirs = true, -- when true, empty folders will be grouped together
			show_unloaded = true,
			window = {
				mappings = {
					["bd"] = "buffer_delete",
					["<bs>"] = "navigate_up",
					["."] = "set_root",
				},
			},
		},
		git_status = {
			window = {
				position = "float",
				mappings = {
					["A"] = "git_add_all",
					["gu"] = "git_unstage_file",
					["ga"] = "git_add_file",
					["gr"] = "git_revert_file",
					["gc"] = "git_commit",
					["gp"] = "git_push",
					["gg"] = "git_commit_and_push",
				},
			},
		},
	})
end

return M
