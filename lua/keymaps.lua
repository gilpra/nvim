local map = vim.keymap.set

-- Simpan File
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map({ "i", "x", "s" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })

-- Mode Switching
map("n", ";", ":", { desc = "Enter command mode" })

-- jk di insert mode = tekan Escape (keluar ke normal mode)
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Navigasi
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
map({ "n", "t" }, "<leader>/", "<cmd>ToggleTerm<CR>", { desc = "Terminal: toggle" })
map({ "n", "t" }, "<leader>z", "<cmd>Zoom<CR>", { desc = "Toggle window zoom" })

-- Tab
map("n", "<leader>tt", "<cmd>tabnew<CR>", {
	desc = "New tab",
})
map("n", "<leader>tn", "<cmd>tabnext<CR>", {
	desc = "Next tab",
})

map("n", "<leader>tp", "<cmd>tabprevious<CR>", {
	desc = "Previous tab",
})

map("n", "<leader>tx", "<cmd>tabclose<CR>", {
	desc = "Close tab",
})

-- Window
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
