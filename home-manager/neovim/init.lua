--Main configuraion file for Neovim by Daniel "Night_H4nter".
--For license, see LICENSE file


--NEVER change the section loading order unless you really know what you're
--doing, otherwise something may break, misbehave, misrender, work slower, etc.

--Conf ALWAYS goes first, user (if any) goes second, key goes last


--correct loading order is:
--   1.  [ section plugins ]
--   2.  [ section ui ]
--   3.  [ section lsp ]
--   3.  [ section functions ]
--   5.  [ section submodules ]
--   6.  [ section keymappings ]




--wrapper function for sourcing viml files
-- local function vimlsource(...)
--     vim.cmd('source ~/.config/nvim/viml/' .. ...)
-- end




-- [ section plugins ]
--vim.cmd('source ~/.config/nvim/plugins.vim')
--
print('ui')


require('user.leaders')
-- [ section primary ui ]
require('user.treesitter')
require('user.ui')
require('user.whichkey')
require('user.neotree')
-- vimlsource('user/statusline.vim')
-- vimlsource('user/tmux-crutch.vim')


-- [ section secondary ui ]
-- vimlsource('user/undotree.vim')
-- require('user.nerdtree')
-- vimlsource('user/ui.vim')
require('user.telescope')
require('user.movement')
--require('user.maximizer')
--vimlsource('user/tagbar.vim')


-- [ section core ]
require('user.options')


-- [ section intellisense ]
require('user.lsp')
require('user.completion')
require('user.linting')
