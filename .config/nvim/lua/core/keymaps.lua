vim.g.mapleader = " "
local map = vim.keymap.set

map('i', '<C-j>', '<Esc>')

--[[
-- NOTE TO SELF:
-- you can select text in visual mode, and use gc
-- to comment out the whole selection. And it is
-- language specific as well! Shit is beatiful
--
-- you can even uncomment things with it as well
-- just select it again and do gc again
--
-- NOTE TO SELF:
-- you can read the whole diagnostic message with
-- <C-w>d after you put the cursor on the offending
-- line
]]--
