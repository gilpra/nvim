local o = vim.opt

-- Leader
vim.g.mapleader = " "

-- UI
o.laststatus = 3
o.showmode = false
o.cursorline = true
o.number = true
o.relativenumber = true
o.scrolloff = 8
o.sidescrolloff = 8
o.wrap = false
o.signcolumn = "yes"
o.termguicolors = true
o.splitbelow = true
o.splitright = true
o.pumblend = 10
o.winblend = 10

-- Indent
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true

-- Search
o.ignorecase = true
o.smartcase = true

-- Behavior
o.mouse = "a"
o.clipboard = "unnamedplus"
o.timeoutlen = 400
o.undofile = true
o.swapfile = false
o.backup = false
o.confirm = true
o.hidden = true
o.wrap = true

-- Command completion
o.wildmode = "longest:full,full"

-- Visual tweaks
vim.opt.fillchars = { eob = " " }
