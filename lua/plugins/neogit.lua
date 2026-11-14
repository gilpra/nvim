local neogit = require("neogit")
neogit.setup({
	process_spinner = true,

	commit_editor = {
		staged_diff_split_kind = "vsplit",
	},

	integrations = {
		mini_pick = true,
		diffview = true,
	},

	diff_viewer = "diffview",

	mappings = {
		commit_editor = {
			["zz"] = "Submit",
			["zq"] = "Abort",
		},
		rebase_editor = {
			["zz"] = "Submit",
			["zq"] = "Abort",
		},
	},
})

local function map(lhs, popup, desc)
	vim.keymap.set("n", lhs, function()
		if popup then
			neogit.open({ popup })
		else
			neogit.open()
		end
	end, {
		desc = desc,
		silent = true,
	})
end

map("<leader>gg", nil, "Git: open Neogit")
map("<leader>gc", "commit", "Git: commit")
map("<leader>gd", "diff", "Git: diff")
map("<leader>gf", "fetch", "Git: fetch")
map("<leader>gl", "log", "Git: log")
map("<leader>gb", "branch", "Git: branches")
map("<leader>gp", "push", "Git: push")
map("<leader>gP", "pull", "Git: pull")
map("<leader>gs", "stash", "Git: stash")
map("<leader>gm", "merge", "Git: merge")
map("<leader>gr", "rebase", "Git: rebase")
