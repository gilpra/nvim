local o = vim.opt

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
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.smartindent = true

-- Pencarian
o.ignorecase = true
o.smartcase = true

-- Perilaku Editor
o.mouse = "a"

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

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
