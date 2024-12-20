local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.nil_ls.setup({
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({ capabilities = capabilities })
vim.g.rustfmt_autosave = 1

lspconfig.denols.setup({
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})
lspconfig.ts_ls.setup({
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("package.json"),
	single_file_support = false,
})

lspconfig.volar.setup({
	capabilities = capabilities,
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = {
		vue = {
			hybridMode = false,
		},
	},
})
lspconfig.pyright.setup({ capabilities = capabilities })
lspconfig.asm_lsp.setup({ capabilities = capabilities })
vim.lsp.inlay_hint.enable()

require("lspsaga").setup({})

vim.api.nvim_set_keymap("n", "<Space>lr", "<cmd>Lspsaga rename<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>d", "<cmd>Lspsaga diagnostic_jump_next<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>D", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>la", "<cmd>Lspsaga code_action<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>ld", "<cmd>Lspsaga goto_definition<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Space>lD", "<cmd>Lspsaga goto_type_definition<cr>", { noremap = true, silent = true })
