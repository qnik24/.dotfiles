vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/saghen/blink.lib",
    "https://github.com/saghen/blink.cmp"
})

require("mason").setup()

local blcmp = require("blink.cmp")
blcmp.build():pwait()
blcmp.setup({
    -- maybe disable the auto complete list and use
    -- ghost text only later, and tab to just select
    -- the ghost text, could be cleaner
    keymap = { preset = "super-tab" },
    completion = {
        ghost_text = { enabled = true }
    }
})

-- Fix for "global vim" problem
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                -- library = { vim.env.VIMRUNTIME },
                -- Index all the available stuff, including plugins
                library =  vim.api.nvim_get_runtime_file("", true)
            },
        },
    },
})

local LSPs = {
    "clangd",
    "lua_ls",
    "jdtls",
    "basedpyright"
}

vim.lsp.enable(LSPs)
