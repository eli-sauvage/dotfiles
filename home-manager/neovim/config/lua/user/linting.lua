--null-ls
local null_ls = require("null-ls")


local cactions = null_ls.builtins.code_actions
local diags = null_ls.builtins.diagnostics
local forters = null_ls.builtins.formatting


null_ls.setup({
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
    forters.prettier

  },
})
