return {
	"saghen/blink.cmp",
	event = "InsertEnter",
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		{
			"windwp/nvim-autopairs",
			opts = {
				check_ts = true,
				disable_filetype = { "TelescopePrompt", "vim" },
			},
		},
	},
	opts = {
		keymap = {
			preset = "default",
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<CR>"] = { "accept", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
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
				-- auto_show = false,
				border = "rounded",
				draw = {
					treesitter = { "lsp" },
				},
			},
			ghost_text = { enabled = false },
		},

		signature = { enabled = true },

		enabled = function()
			return not vim.tbl_contains({ "markdown", "text", "gitcommit", "oil" }, vim.bo.filetype)
		end,
	},
}
