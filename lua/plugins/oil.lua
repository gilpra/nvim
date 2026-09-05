local M = {}

function M.setup()
	require("oil").setup({
		columns = {
			"mtime",
			"icon",
		},
		buf_options = {
			buflisted = false,
			bufhidden = "hide",
		},
		win_options = {
			wrap = false,
			signcolumn = "no",
			cursorcolumn = false,
			foldcolumn = "0",
			spell = false,
			list = false,
			conceallevel = 3,
			concealcursor = "nvic",
		},
		delete_to_trash = true,
		skip_confirm_for_simple_edits = false,
		prompt_save_on_select_new_entry = true,
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-v>"] = "actions.select_vsplit",
			["<C-x>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<C-r>"] = "actions.refresh",
			[","] = "actions.parent",
			["<"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
		use_default_keymaps = true,
		view_options = {
			show_hidden = false,
			is_hidden_file = function(name, _)
				return vim.startswith(name, ".")
			end,
			is_always_hidden = function(name, _)
				return name == ".git"
			end,
			natural_order = true,
			sort = {
				{ "type", "asc" },
				{ "name", "asc" },
			},
		},
	})

	vim.keymap.set("n", ",", "<CMD>Oil<CR>", { desc = "Open explorer" })
end

return M
