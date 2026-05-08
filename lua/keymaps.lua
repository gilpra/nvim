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

-- Navigasi Antar Panel
map("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper pane" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower pane" })

-- Resize Panel
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Pane: decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Pane: increase width" })
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Pane: increase height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Pane: decrease height" })

-- Terminal Mode
map("t", "jk", [[<C-\><C-n>]], { desc = "Terminal: exit to normal mode" })

-- Tmux
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>")
