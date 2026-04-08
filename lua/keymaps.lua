local map = vim.keymap.set

map("n", "<C-s>", "<cmd> w <CR>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<Esc>")
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd> w <CR><Esc>", { desc = "Save file" })
map({ "n", "v" }, "B", "^", { desc = "Beginning of line" })
map({ "n", "v" }, "W", "$", { desc = "End of line" })

-- Coment
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

-- nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")

-- telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
map("n", "<leader>fg", "<cmd> Telescope live_grep <CR>")
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>")

-- bufferline
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<leader>x", "<cmd> bd <CR>")
