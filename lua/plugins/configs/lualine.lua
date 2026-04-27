return {
	options = {
		icons_enabled = true,
		theme = "auto",

		component_separators = { left = "│", right = "│" },
		section_separators = { left = "", right = "" },

		disabled_filetypes = {
			statusline = { "NvimTree", "starter" },
			winbar = {},
		},

		globalstatus = true, -- more lightweight than per-window
	},

	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{ "branch", icons_enabled = true },
			{ "diff", colored = false },
			{ "diagnostics", sources = { "nvim_lsp" } },
		},

		lualine_c = {
			{
				"filename",
				path = 1, -- relative path
				symbols = { modified = " ", readonly = " " },
			},
		},

		lualine_x = {
			"encoding",
			"fileformat",
			"filetype",
		},

		lualine_y = { "progress" },
		lualine_z = { "location" },
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
}
