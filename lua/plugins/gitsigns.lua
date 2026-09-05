local M = {}

function M.setup()
	require("gitsigns").setup({
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
		},

		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, {
					buffer = bufnr,
					desc = desc,
					nowait = true,
					silent = true,
				})
			end

			map("n", "]h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gs.next_hunk()
				end
			end, "Git: hunk berikutnya")

			map("n", "[h", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gs.prev_hunk()
				end
			end, "Git: hunk sebelumnya")

			map("n", "<leader>hs", gs.stage_hunk, "Git: stage hunk")
			map("n", "<leader>hr", gs.reset_hunk, "Git: reset hunk")
			map("n", "<leader>hu", gs.undo_stage_hunk, "Git: undo stage hunk")
			map("n", "<leader>hp", gs.preview_hunk, "Git: preview hunk")
			map("n", "<leader>hb", gs.blame_line, "Git: blame baris ini")
		end,
	})
end

return M
