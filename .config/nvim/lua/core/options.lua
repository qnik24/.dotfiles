vim.o.number = true
vim.o.relativenumber = true

-- display
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

-- diagnostics
vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true
})

-- indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = -1 
vim.o.expandtab = true

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- behaviour
vim.o.confirm = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.timeoutlen = 500
vim.o.updatetime = 200

-- clipboard
vim.o.clipboard = "unnamedplus"
