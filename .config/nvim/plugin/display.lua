vim.pack.add({
    "https://github.com/stevedylandev/darkmatter-nvim",
    "https://github.com/nvim-lualine/lualine.nvim"
})

vim.cmd.colorscheme("darkmatter")
require("lualine").setup({})
