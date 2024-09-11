----Telescope keybindings



--Telescope files
vim.api.nvim_set_keymap( 'n', '<Space>ff', '<cmd>Telescope find_files<cr>',
	{ noremap = true, silent = true })


--Telescope live_grep
vim.api.nvim_set_keymap( 'n', '<Space>fg', '<cmd>Telescope live_grep<cr>',
	{ noremap = true, silent = true })


--Telescope project files
vim.api.nvim_set_keymap( 'n', '<Space>fp', '<cmd>Telescope git_files<cr>',
	{ noremap = true, silent = true })


--Telescope buffers
vim.api.nvim_set_keymap( 'n', '<Space>fb', '<cmd>Telescope buffers<cr>',
	{ noremap = true, silent = true })


--esc to quit TODO:make it work
-- require("telescope").setup({
--     defaults = {
--         mappings = {
--             i = {
--                 ["<esc>"] = actions.close,
--             },
--         },
--     },
-- })
