local o = vim.opt

-- UI
o.laststatus = 3
o.showmode = false
o.showtabline = 2
o.cursorline = true
o.number = true
o.relativenumber = true
o.numberwidth = 4
o.scrolloff = 8
o.sidescrolloff = 8
o.signcolumn = "yes"
o.termguicolors = true
o.splitbelow = true
o.splitright = true
o.updatetime = 300

-- Editing
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.smartindent = true
o.wrap = false

-- Search
o.ignorecase = true
o.smartcase = true
o.inccommand = "split"

-- Completion
o.completeopt = "menuone,noinsert,fuzzy"
o.pumborder = "single"
o.pumheight = 12

-- UX
o.mouse = "a"
o.timeoutlen = 1000

-- Files
o.undofile = true
o.swapfile = false
o.backup = false
o.confirm = true
o.autoread = true

-- Clipboard
o.clipboard = "unnamedplus"

o.fillchars = {
	eob = " ",
}
