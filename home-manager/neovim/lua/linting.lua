--null-ls
local null_ls = require("null-ls")

local cactions = null_ls.builtins.code_actions
local diags = null_ls.builtins.diagnostics
local forters = null_ls.builtins.formatting

null_ls.setup({
	options = {
		root_dir = require("null-ls.utils").root_pattern("node-package.json, Cargo.toml"),
	},
	sources = {

		cactions.refactoring,
		-- cactions.shellcheck,
		cactions.statix,

		diags.deadnix,
		diags.ansiblelint,
		diags.checkmake,
		-- TODO:this thing wants ec binary to be present,
		-- maybe fix later
		-- TODO:idk what was wrong but whatever
		diags.editorconfig_checker,
		-- diags.luacheck,
		diags.markdownlint,
		-- diags.shellcheck,
		diags.yamllint,
		diags.zsh,

		forters.alejandra,
		forters.stylua,
		forters.prettier,
	},
	-- format on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					-- vim.lsp.buf.formatting_sync()
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})
