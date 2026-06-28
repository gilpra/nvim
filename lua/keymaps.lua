local map = vim.keymap.set

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end)

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

map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

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
map("n", "<leader>z", "<cmd>Zoom<CR>", { desc = "Toggle window zoom" })
