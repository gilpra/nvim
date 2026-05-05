return {
	options = {
		icons_enabled = true,
		theme = "auto", -- otomatis ikuti colorscheme aktif

		component_separators = { left = "│", right = "│" },
		section_separators = { left = "", right = "" },

		disabled_filetypes = {
			statusline = { "oil" }, -- sembunyikan statusbar saat oil terbuka
			winbar = {},
		},

		globalstatus = true,
	},

	sections = {
		lualine_a = { "mode" }, -- mode: NORMAL, INSERT, VISUAL, dll
		lualine_b = {
			{ "branch", icons_enabled = true }, -- nama git branch
			{ "diff", colored = false }, -- +tambah ~ubah -hapus
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
			"encoding",
			"fileformat",
			"filetype",
		},

		lualine_y = { "progress" }, -- persentase posisi di file (TOP, 50%, BOT)
		lualine_z = { "location" }, -- baris:kolom
	},

	-- Tampilan untuk window yang tidak aktif (split lain)
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
