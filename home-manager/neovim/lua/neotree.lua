require("neo-tree").setup({})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle reveal=true<cr>", { noremap = true })
vim.keymap.set("n", "<leader>n", "<cmd>Neotree focus<cr>", { noremap = true })
vim.keymap.set("n", "<leader>b", "<cmd>Neotree source=buffers<cr>", { noremap = true })
vim.keymap.set("n", "<leader>gs", "<cmd>Neotree source=git_status<cr>", { noremap = true })
