local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.nil_ls.setup({
	capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({})
lspconfig.volar.setup({
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
})
lspconfig.tsserver.setup({
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = binaries.tsserver,
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
})

-- lspconfig.opts = function()
--   local ret = {
--     inlay_hints = {
--       enable = true,
--     }
--   }
-- end
--
vim.lsp.inlay_hint.enable()
