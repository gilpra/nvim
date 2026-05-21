return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "BufReadPre",
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
		{ "<leader>x", "<cmd>bd<CR>", desc = "Close buffer" },
		{ "<leader>bx", "<cmd>BufferLineCloseOthers<CR>", desc = "Close others" },
	},
	opts = {
		options = {
			mode = "buffers",

			separator_style = "thin", -- "slant" | "slope" | "thick" | "thin"

			show_buffer_close_icons = false,
			show_close_icon = false,

			always_show_bufferline = true,
			indicator = { style = "underline" },
			numbers = "none",
			themable = true,

			diagnostics = "nvim_lsp",

			offsets = {
				{
					filetype = "oil",
					text = "Oil",
					text_align = "left",
					separator = true,
				},
			},
		},
	},
}
