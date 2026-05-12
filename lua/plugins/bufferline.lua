return {
	"akinsho/bufferline.nvim",
	event = "BufReadPre",
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
		{ "<leader>x", "<cmd>bd<CR>", desc = "Close buffer" },
		{ "<leader>bx", "<cmd>BufferLineCloseOthers<CR>", desc = "Close others" },
	},
	opts = {
		options = {
			always_show_bufferline = false,
			show_close_icon = false,
			show_buffer_close_icons = false,
			separator_style = "thin", -- "slant" | "slope" | "thick" | "thin"
			indicator = { style = "underline" },
			numbers = "none",
			themable = true,
		},
	},
}
