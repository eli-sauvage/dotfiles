-- set tab width to 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2


--make comments work
require('kommentary.config').configure_language("nix", {
    single_line_comment_string = "#",
    multi_line_comment_strings = false,
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true,
})
