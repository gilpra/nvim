vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("vim._core.ui2").enable({})

-- Instal plugin with vim.pack
vim.pack.add({
    { src = "https://github.com/gilpra/yoruakari.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/saghen/blink.cmp",                 version = "v1" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/Senal-D-A-Gunaratna/swapson.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/christoomey/vim-tmux-navigator" },
    { src = 'https://github.com/nvim-mini/mini.nvim',              version = 'stable' },
    { src = "https://github.com/OXY2DEV/markview.nvim" },
})

-- Set default theme
vim.cmd.colorscheme("yoruakari")

-- Configure plugins
require("plugins.oil")
require("plugins.treesitter")
require("plugins.blink")
require("plugins.mason")
require("plugins.swapson")
require("plugins.conform")
require("plugins.gitsigns")
require("plugins.mini")
require("plugins.markview")

require("lsp")
require("options")
require("autocmds")
require("commands")
require("keymaps")
require("tasks")
require("statusline").setup()
require("tabline").setup()
