local M = {}

function M.setup()
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
				"%.git/",
				"dist/",
				"build/",
				"__pycache__/",
				"%.lock",
			},
		},
		pickers = {
			find_files = {
				hidden = true,
				no_ignore = false,
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})

	telescope.load_extension("fzf")

	local map = vim.keymap.set
	map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
	map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
	map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
	map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
	map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
end

return M
