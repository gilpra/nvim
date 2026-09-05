vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true

require("vim._core.ui2").enable({})

-- Local theme
vim.cmd.colorscheme("monochrome")

-- Native plugin manager (Neovim 0.12+).
-- vim.pack installs plugins under stdpath("data")/site/pack/core/opt.
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind

		if kind ~= "install" and kind ~= "update" then
			return
		end

		if name == "telescope-fzf-native.nvim" then
			vim.system({ "make" }, { cwd = ev.data.path }):wait()
		elseif name == "nvim-treesitter" then
			vim.schedule(function()
				vim.cmd.packadd("nvim-treesitter")
				vim.cmd("TSUpdate")
			end)
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/catgoose/nvim-colorizer.lua" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

-- Configure plugins after they have been installed/loaded.
require("plugins.gitsigns").setup()
require("plugins.nvim-colorizer").setup()
require("plugins.blink").setup()
require("plugins.oil").setup()
require("plugins.telescope").setup()
require("plugins.lsp").setup()
require("plugins.mason").setup()
require("plugins.conform").setup()
require("plugins.treesitter").setup()

require("options")
require("autocmds")
require("commands")
require("keymaps")
require("tasks")
require("statusline").setup()
require("tabline").setup()
