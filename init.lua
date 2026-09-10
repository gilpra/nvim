vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("vim._core.ui2").enable({})

-- Local theme
vim.cmd.colorscheme("monochrome")

-- Handle plugin build steps after installation or update
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind

    if name == "telescope-fzf-native.nvim"
      and (kind == "install" or kind == "update")
    then
      vim.system({ "make" }, {
        cwd = ev.data.path,
      })
    end
  end,
})

-- Instal plugin with vim.pack
vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
})

-- Configure plugins
require("plugins.oil")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.blink")

require("lsp")
require("options")
require("autocmds")
require("commands")
require("keymaps")
require("tasks")
require("statusline").setup()
require("tabline").setup()
