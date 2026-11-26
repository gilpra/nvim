require("oil").setup({
	columns = {
		"mtime",
		"size",
		"icon",
	},
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["<C-v>"] = "actions.select_vsplit",
		["<C-x>"] = "actions.select_split",
		["<C-t>"] = "actions.select_tab",
		["<C-p>"] = "actions.preview",
		["q"] = "actions.close",
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
	view_options = {
		is_always_hidden = function(name, _)
			return name == ".git"
		end,
	},
})

vim.keymap.set("n", ",", "<CMD>Oil<CR>", { desc = "Open explorer" })
