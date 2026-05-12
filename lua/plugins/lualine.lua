return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {

		options = {
			icons_enabled = false,
			theme = function()
				return require("minimal-night.lualine").get()
			end,

			component_separators = { left = "│", right = "│" },
			section_separators = { left = "", right = "" },

			disabled_filetypes = {
				statusline = { "oil" }, -- sembunyikan statusbar saat oil terbuka
				winbar = {},
			},

			globalstatus = true,
			refresh = {
				statusline = 500,
				tabline = 1000,
				winbar = 1000,
			},
		},

		sections = {
			lualine_a = { "mode" }, -- mode: NORMAL, INSERT, VISUAL, dll
			lualine_b = {
				{ "branch", icons_enabled = true }, -- nama git branch
				{ "diagnostics", sources = { "nvim_lsp" } }, -- error/warning dari LSP
			},

			lualine_c = {
				{
					"filename",
					path = 1,
					symbols = { modified = " ", readonly = " " },
				},
			},

			lualine_x = {
				"fileformat",
				"filetype",
			},

			lualine_y = {},
			lualine_z = { "location" }, -- baris:kolom
		},

		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},

		tabline = {},
		extensions = {},
	},
}
