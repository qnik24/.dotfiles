vim.pack.add({ 
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim"
})

-- TODO: add the <C-j> to exit typing
require("telescope").setup({})

--[[
-- NOTE TO SELF:
-- You can use <C-x> for horizontally, and <C-v> veritacally opening
-- files through telescope, even without leaving the insert mode
]]--

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
