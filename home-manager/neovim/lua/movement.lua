--quickly jump to stuff
local myjump = function()
    require("flash").jump({
        highlight = {
            matches = false,
        },
    })
end
vim.keymap.set('n', '<CR>', myjump, { noremap = true })

