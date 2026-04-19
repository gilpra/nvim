return {
	keymap = {
		preset = "default",
		["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		["<C-e>"] = { "hide" },
		["<C-d>"] = { "scroll_documentation_down", "fallback" },
		["<C-u>"] = { "scroll_documentation_up", "fallback" },
	},
	appearance = {
		use_nvim_cmp_as_default = false,
		nerd_font_variant = "mono",
	},
	snippets = {
		preset = "luasnip",
	},
	sources = {
		default = { "lsp", "path", "buffer", "snippets" },
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
		},
		menu = {
			border = "rounded",
			draw = {
				treesitter = { "lsp" },
			},
		},
		ghost_text = { enabled = false },
	},
	signature = { enabled = true },
	enabled = function()
		if vim.tbl_contains({ "markdown", "text", "gitcommit" }, vim.bo.filetype) then
			return false
		end
	end,
}
