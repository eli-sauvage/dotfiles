--Telescope files
vim.api.nvim_set_keymap("n", "<Space>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })

--Telescope live_grep
vim.api.nvim_set_keymap("n", "<Space>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })

--Telescope project files
vim.api.nvim_set_keymap("n", "<Space>fp", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true })

--Telescope buffers
vim.api.nvim_set_keymap("n", "<Space>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { noremap = true })
vim.keymap.set("n", "<leader>x", "<cmd>BufferClose<cr>", { noremap = true })
vim.keymap.set("n", "<leader>X", "<cmd>BufferCloseAllButCurrent<cr>", { noremap = true })
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { noremap = true })

-- copy paste
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = false })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = false })
-- vim.keymap.set("v", "<leader>y", '"+y', { noremap = false })
-- vim.keymap.set("v", "<leader>p", '"+p', { noremap = false })

-- arrow keys
vim.keymap.set({ "n", "v", "i" }, "<Left>", "<nop>", { noremap = true })
vim.keymap.set({ "n", "v", "i" }, "<Right>", "<nop>", { noremap = true })
vim.keymap.set({ "n", "v", "i" }, "<Up>", "<nop>", { noremap = true })
vim.keymap.set({ "n", "v", "i" }, "<Down>", "<nop>", { noremap = true })

vim.keymap.set("i", "jj", "<esc>", { noremap = true })
