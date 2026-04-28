return {
	open_cmd = "noswapfile vnew", -- buka di vertical split
	live_update = false, -- true = update realtime saat mengetik (lebih berat)
	is_insert_mode = false,
	mapping = {
		["toggle_line"] = {
			map = "dd",
			cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
			desc = "Toggle item",
		},
		["enter_file"] = {
			map = "<CR>",
			cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
			desc = "Buka file",
		},
		["send_to_qf"] = {
			map = "<leader>sq",
			cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
			desc = "Kirim ke quickfix",
		},
		["replace_cmd"] = {
			map = "<leader>sc",
			cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
			desc = "Input replace command",
		},
		["run_current_replace"] = {
			map = "<leader>rc",
			cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
			desc = "Replace baris ini",
		},
		["run_replace"] = {
			map = "<leader>R",
			cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
			desc = "Replace semua",
		},
		["toggle_ignore_case"] = {
			map = "ti",
			cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
			desc = "Toggle ignore case",
		},
		["toggle_ignore_hidden"] = {
			map = "th",
			cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
			desc = "Toggle hidden files",
		},
	},
}
