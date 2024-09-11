--set tab width to 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

--single line comments only
require("kommentary.config").configure_language("lua", {
	prefer_single_line_comments = true,
	use_consistent_indentation = true,
	ignore_whitespace = true,
})
