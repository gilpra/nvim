vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("vim._core.ui2").enable({})

-- Local theme
vim.cmd.colorscheme("monochrome")

-- Instal plugin with vim.pack
vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

-- Configure plugins
require("plugins.oil")

require("options")
require("autocmds")
require("commands")
require("keymaps")
require("tasks")
require("statusline").setup()
require("tabline").setup()
