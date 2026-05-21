local map = vim.keymap.set

-- Simpan File
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map({ "i", "x", "s" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })

-- Mode Switching
map("n", ";", ":", { desc = "Enter command mode" })

-- jk di insert mode = tekan Escape (keluar ke normal mode)
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Navigasi
map("n", "<C-a>", "ggVG", { desc = "Select all text" })
map({ "n", "v" }, "H", "^", { desc = "Jump to beginning of line" })
map({ "n", "v" }, "L", "$", { desc = "Jump to end of line" })
map("v", "<", "<gv", { desc = "Indent left keep visual" })
map("v", ">", ">gv", { desc = "Indent right keep visual" })

-- Hapus highlight kuning setelah pencarian dengan /
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Edit
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Komentar
map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle line comment" })
map("v", "<leader>/", "gc", { remap = true, desc = "Toggle selection comment" })

-- Split Window
map("n", "<leader>sh", "<cmd>sp<CR>", { desc = "Split: horizontal" })
map("n", "<leader>sv", "<cmd>vsp<CR>", { desc = "Split: vertical" })
map("n", "<leader>se", "<cmd>wincmd =<CR>", { desc = "Split: equalize size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Split: close current pane" })

-- Resize Panel
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Pane: decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Pane: increase width" })
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Pane: increase height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Pane: decrease height" })

-- Terminal Mode
map("t", "jk", [[<C-\><C-n>]], { desc = "Terminal: exit to normal mode" })

local terminal_buf = nil
local terminal_win = nil

local function toggle_terminal()
	-- Jika terminal sedang terbuka -> tutup split
	if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
		vim.api.nvim_win_close(terminal_win, true)
		terminal_win = nil
		return
	end

	-- Buat buffer baru jika belum ada
	if not terminal_buf or not vim.api.nvim_buf_is_valid(terminal_buf) then
		terminal_buf = vim.api.nvim_create_buf(false, true)
		-- Pastikan buffer tidak ikut ke-wipe saat window-nya ditutup
		vim.bo[terminal_buf].bufhidden = "hide"
	end

	-- Buat split
	vim.cmd("botright split")
	vim.api.nvim_win_set_height(0, 15)
	terminal_win = vim.api.nvim_get_current_win()

	-- Pasang buffer terminal ke window
	vim.api.nvim_win_set_buf(terminal_win, terminal_buf)

	-- Jalankan shell hanya jika buffer belum jadi terminal
	if vim.bo[terminal_buf].buftype ~= "terminal" then
		vim.fn.jobstart({ vim.o.shell }, { term = true })
	end

	-- Masuk terminal mode
	vim.cmd("startinsert")
end

-- Otomatis tutup window jika shell exit
vim.api.nvim_create_autocmd("TermClose", {
	callback = function(args)
		if args.buf == terminal_buf and terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
			vim.api.nvim_win_close(terminal_win, true)
			terminal_win = nil
			terminal_buf = nil
		end
	end,
})

map({ "n", "t" }, "<leader>t", toggle_terminal, {
	desc = "Terminal: toggle",
})

map("t", "jk", [[<C-\><C-n>]], {
	desc = "Terminal: exit to normal mode",
})

-- Tmux
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>")
