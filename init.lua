vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("vim._core.ui2").enable({})

-- Local theme
vim.cmd.colorscheme("monochrome")

-- Instal plugin with vim.pack
vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

-- Configure plugins
require("plugins.oil")
require("plugins.treesitter")

require("options")
require("autocmds")
require("commands")
require("keymaps")
require("tasks")
require("statusline").setup()
require("tabline").setup()
