--Cross-buffer navigation bindings

--tab/buffer navigation with a key sequence
vim.api.nvim_set_keymap("n", "<Space>1", "<cmd>call lightline#bufferline#go(1)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>2", "<cmd>call lightline#bufferline#go(2)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>3", "<cmd>call lightline#bufferline#go(3)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>4", "<cmd>call lightline#bufferline#go(4)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>5", "<cmd>call lightline#bufferline#go(5)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>6", "<cmd>call lightline#bufferline#go(6)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>7", "<cmd>call lightline#bufferline#go(7)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>8", "<cmd>call lightline#bufferline#go(8)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>9", "<cmd>call lightline#bufferline#go(9)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>0", "<cmd>call lightline#bufferline#go(10)<cr>", { noremap = true })

--tab/buffer navigation with a key chord
vim.api.nvim_set_keymap("n", "<A-1>", "<cmd>call lightline#bufferline#go(1)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-2>", "<cmd>call lightline#bufferline#go(2)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-3>", "<cmd>call lightline#bufferline#go(3)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-4>", "<cmd>call lightline#bufferline#go(4)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-5>", "<cmd>call lightline#bufferline#go(5)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-6>", "<cmd>call lightline#bufferline#go(6)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-7>", "<cmd>call lightline#bufferline#go(7)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-8>", "<cmd>call lightline#bufferline#go(8)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-9>", "<cmd>call lightline#bufferline#go(9)<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-0>", "<cmd>call lightline#bufferline#go(10)<cr>", { noremap = true })

--window navigation with a key sequence
vim.api.nvim_set_keymap("n", "<space>j", "<c-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>k", "<c-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>l", "<c-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>;", "<c-w>l", { noremap = true })

--window navigation with a key chord
vim.api.nvim_set_keymap("n", "<a-j>", "<c-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-k>", "<c-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-l>", "<c-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-;>", "<c-w>l", { noremap = true })

--disable default window navigation
vim.api.nvim_set_keymap("n", "<c-w>h", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w>j", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w>k", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w>l", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w>w", "<NOP>", { noremap = true })
