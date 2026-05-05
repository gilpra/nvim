return {
	signs = {
		add = { text = "▎" }, -- baris baru ditambahkan
		change = { text = "▎" }, -- baris yang sudah ada diubah
		delete = { text = "" }, -- baris dihapus (panah menunjuk ke atas)
		topdelete = { text = "" }, -- baris pertama dari sekelompok dihapus
		changedelete = { text = "▎" }, -- baris diubah lalu sebagian dihapus
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

		-- Stage = tandai perubahan ini siap untuk di-commit
		map("n", "<leader>hs", gs.stage_hunk, "Git: stage hunk")
		-- Reset = batalkan perubahan di hunk ini, kembalikan ke versi git
		map("n", "<leader>hr", gs.reset_hunk, "Git: reset hunk")
		-- Undo stage = batalkan staging (kebalikan dari stage)
		map("n", "<leader>hu", gs.undo_stage_hunk, "Git: undo stage hunk")
		-- Preview = lihat diff perubahan di floating window kecil
		map("n", "<leader>hp", gs.preview_hunk, "Git: preview hunk")
		-- Blame = tampilkan siapa yang menulis baris ini, kapan, dan pesan commitnya
		map("n", "<leader>hb", gs.blame_line, "Git: blame baris ini")
	end,
}
