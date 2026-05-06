local M = {}

M.setup = function()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
			},
			sorting_strategy = "ascending",

			file_ignore_patterns = {
				"node_modules/",
				".git/",
				"dist/",
				"build/",
				"__pycache__/",
				"%.lock",
			},
		},

		extensions = {
			fzf = {
				fuzzy = true, -- aktifkan fuzzy matching
				override_generic_sorter = true, -- ganti sorter default telescope
				override_file_sorter = true, -- ganti file sorter default
				case_mode = "smart_case", -- otomatis: capslock=sensitive, huruf kecil=insensitive
			},
		},
	})

	telescope.load_extension("fzf")
end

return M
