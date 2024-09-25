----Vanilla ui settings

--use true colors
vim.opt.termguicolors = true

--set colorscheme
-- vim.cmd('colorscheme ts-neosolarized-ext')
-- vim.cmd('colorscheme codedark')
vim.cmd("colorscheme solarized")
-- this MUST be done in this order otherwise it won't work
-- vim.g.selenized_green_keywords = 1
-- vim.cmd('colorscheme selenized')

--mouse scrolling
vim.opt.mouse = "a"

--absolute and relative line numbers
vim.opt.relativenumber = true
vim.opt.number = true

--cusor crossing
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

--always show sign column
vim.opt.signcolumn = "yes"

--split right below
vim.opt.splitright = true
vim.opt.splitbelow = true

--keep cursor closer to center
vim.opt.scrolloff = 8

--wrap long lines
vim.opt.wrap = true
vim.opt.linebreak = true

--highlight substring matching regex
vim.opt.hlsearch = true

--search incrementally
vim.opt.incsearch = true

--limit preview window hight
vim.opt.previewheight = 5

--set window title
vim.opt.title = true
