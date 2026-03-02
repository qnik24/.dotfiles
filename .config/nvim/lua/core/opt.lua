local o = vim.opt

o.encoding = "utf-8"
o.fileencoding = "utf-8"

o.mouse = "a"
o.clipboard = "unnamedplus"

o.splitright = true
o.splitbelow = true
o.wrap = false

o.number = true
o.relativenumber = true

o.termguicolors = true
o.cursorline = true
o.signcolumn = "yes:2"

-- i'm using a plugin for these
o.showmode = false
o.laststatus = 3
o.showtabline = 0

o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.hlsearch = true

o.backup = false
o.writebackup = false
o.swapfile = true -- leave it on for now in case maybe crashes?
o.undofile = true
