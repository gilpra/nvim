return {
	"catgoose/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		filetypes = {
			"css",
			"html",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"lua",
			"json",
			"yaml",
			"toml",
			"scss",
		},
		user_default_options = {
			RGB = true,
			RRGGBB = true,
			names = false,
			RRGGBBAA = true,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
		},
	},
}
