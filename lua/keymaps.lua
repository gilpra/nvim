local map = vim.keymap.set

map("n", "<C-s>", "<cmd>w<CR>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<Esc>")
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })
map({ "n", "v" }, "H", "^", { desc = "Beginning of line" })
map({ "n", "v" }, "L", "$", { desc = "End of line" })
map("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })
-- Memindah blok teks yang diseleksi ke atas/bawah
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Coment
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

-- Split window
map("n", "<leader>sh", "<cmd>sp<CR>")
map("n", "<leader>sv", "<cmd>vsp<CR>")
map("n", "<leader>se", "<cmd>wincmd =<CR>")
map("n", "<leader>sx", "<cmd>close<CR>")

-- Navigasi split (lebih cepat dari <C-w>hjkl)
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize split
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")
map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")

-- oil
map("n", "-", "<CMD>Oil<CR>")

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>")

-- bufferline
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
map("n", "<leader>x", "<cmd>bd<CR>")

-- Trouble
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<CR>")
map("n", "<leader>td", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>")
map("n", "<leader>ts", "<cmd>Trouble symbols toggle<CR>")
map("n", "<leader>tl", "<cmd>Trouble lsp toggle<CR>")
map("n", "<leader>tq", "<cmd>Trouble qflist toggle<CR>")

-- Toggleterm
map("n", "<leader>\\", "<cmd>ToggleTerm<CR>")
map("t", "<leader>\\", "<cmd>ToggleTerm<CR>")
map("t", "jj", [[<C-\><C-n>]])
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>")
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>")
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>")

-- Spectre
map("n", "<leader>sr", "<cmd>Spectre<CR>", { desc = "Spectre: buka panel" })
map(
	"n",
	"<leader>sw",
	"<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
	{ desc = "Spectre: cari kata di cursor" }
)
map("v", "<leader>sw", "<cmd>lua require('spectre').open_visual()<CR>", { desc = "Spectre: cari selection" })
map(
	"n",
	"<leader>sf",
	"<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
	{ desc = "Spectre: cari di file ini saja" }
)
