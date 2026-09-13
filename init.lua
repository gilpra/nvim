vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("vim._core.ui2").enable({})

-- Local theme
vim.cmd.colorscheme("monochrome")

-- Instal plugin with vim.pack
vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/saghen/blink.cmp",                version = "v1" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/christoomey/vim-tmux-navigator" },
    { src = 'https://github.com/nvim-mini/mini.nvim',             version = 'stable' },
})

-- Configure plugins
require("plugins.oil")
require("plugins.treesitter")
require("plugins.blink")
require("plugins.mason")
require("plugins.conform")
require("plugins.gitsigns")
require("plugins.mini")

require("lsp")
require("options")
require("autocmds")
require("commands")
require("keymaps")
require("tasks")
require("statusline").setup()
require("tabline").setup()
