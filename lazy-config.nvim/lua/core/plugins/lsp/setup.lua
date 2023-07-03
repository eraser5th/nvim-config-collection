local M = {}

M.setup = function()
	local mason = require("mason")
	local masonLspConfig = require("mason-lspconfig")
	local lspconfig = require("lspconfig")
	local cmpLsp = require("cmp_nvim_lsp")

	mason.setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	masonLspConfig.setup({
		ensure_installed = {
			"lua_ls",
			"jsonls",
			"tsserver",
			"eslint",
			"prismals",
			"tailwindcss",
			"html",
			"cssls",
			"astro",
			"yamlls",
			"taplo",
			"marksman",
			"dockerls",
			"cssmodules_ls",
			"volar",
			"angularls",
			"rust_analyzer",
		},
	})

	local opts = {
		capabilities = cmpLsp.default_capabilities(),
		on_attach = require("core.plugins.lsp.on_attach").on_attach,
	}

	masonLspConfig.setup_handlers({
		function(server_name)
			local has_custom_opts, custom_opts = pcall(require, "core.plugins.lsp.settings." .. server_name)

			if has_custom_opts then
				opts = vim.tbl_deep_extend("force", custom_opts, opts)
			end

			lspconfig[server_name].setup(opts)
		end,
		["tsserver"] = function()
			require("typescript").setup({
				server = opts,
			})
		end,
		["rust_analyzer"] = function()
			require("rust-tools").setup({ server = opts })
		end,
	})
end

return M
