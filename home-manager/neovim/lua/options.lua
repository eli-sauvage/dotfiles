--ignore case when search query has no capital
--letters, don't ignore otherwise
vim.opt.ignorecase = true
vim.opt.smartcase = true

--set encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- vim.opt.termencoding = 'utf-8'

--automatically read changes
vim.opt.autoread = true

--expand tab to 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

--don't load netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--fold method
vim.opt.foldmethod = "marker"

--remove "hit enter" stuff
vim.opt.shortmess = "filnxtToOFIc"

--fix buffer switching
vim.opt.hidden = true

--lsp compat
vim.g.nobackup = true
vim.g.nowritebackup = true

--make neovim quicker
vim.g.update_time = 100

--timeout to complete mapping or hint
vim.g.timeoutlen = 300

--go fast (replaces impatient)
vim.loader.enable()
