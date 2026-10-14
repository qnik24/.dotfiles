vim.pack.add({ 
    "https://github.com/nvim-mini/mini.pairs",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/stevearc/oil.nvim"
})

require("mini.pairs").setup()
require("oil").setup({
    default_file_explorer = true,
    columns = { "icon" },
    buf_options = {
        buflisted = false,
        bufhidden = "hide"
    }
})

-- use the suggested mapping for now
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
