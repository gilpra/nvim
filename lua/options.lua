local o = vim.opt

-- Leader Key
vim.g.mapleader = " "

-- Tampilan UI
o.laststatus = 3
o.showmode = false
o.cursorline = true
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.scrolloff = 8
o.sidescrolloff = 8
o.signcolumn = "yes"
o.termguicolors = true
o.splitbelow = true
o.splitright = true
o.pumblend = 10
o.winblend = 10
o.updatetime = 250

-- Indentasi
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true

-- Pencarian
o.ignorecase = true
o.smartcase = true

-- Perilaku Editor
o.mouse = "a"
o.clipboard = "unnamedplus"
o.timeoutlen = 400
o.undofile = true
o.swapfile = false
o.backup = false
o.confirm = true
o.wrap = true

-- Command Completion
o.wildmode = "longest:full,full"

-- Visual Tweaks
vim.opt.fillchars = { eob = " " }
