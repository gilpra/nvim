return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"saghen/blink.cmp",
	},
	config = function()
		require("configs.lsp").setup()
	end,
}
