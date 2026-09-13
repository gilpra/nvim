require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<S-Tab>"] = { "show", "fallback" },
		["<Tab>"] = { "select_and_accept", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-e>"] = { "cancel", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
	},

	snippets = {
		preset = "mini_snippets",
	},

	sources = {
		default = { "lsp", "path", "buffer", "snippets" },
	},

	cmdline = {
		enabled = true,
		sources = { "cmdline" },
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
		menu = {
			border = "single",
			draw = {
				treesitter = { "lsp" },
			},
		},
	},

	signature = { enabled = true },

	enabled = function()
		return not vim.tbl_contains({ "markdown", "text", "gitcommit", "oil" }, vim.bo.filetype)
	end,
})
