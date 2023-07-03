local M = {}

M.setup = function()
	local masonNullLs = require("mason-null-ls")
	local nullLsAutomaticSetup = require("mason-null-ls.automatic_setup")
	local null_ls = require("null-ls")

	masonNullLs.setup({
		ensure_installed = { "stylua", "prettier", "eslint" },
	})

	masonNullLs.setup_handlers({
		function(source_name, methods)
			-- all sources with no handler get passed here
			-- Keep original functionality of `automatic_setup = true`
			nullLsAutomaticSetup(source_name, methods)
		end,
		stylua = function()
			null_ls.register(null_ls.builtins.formatting.stylua)
		end,
	})

	-- will setup any installed and configured sources above
	null_ls.setup({
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						--[[
						if vim.bo.filetype == "typescriptreact" or vim.bo.filetype == "typescript" then
							vim.cmd("TypescriptOrganizeImports!")
						end
            --]]
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	})
end

return M
