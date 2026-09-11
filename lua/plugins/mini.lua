local map = vim.keymap.set

-- Auto pairs
require("mini.pairs").setup()

-- Enhanced a/i
require("mini.ai").setup()

-- Enhanced surround
require("mini.surround").setup()

-- Picker
require("mini.pick").setup({
    options = {
        use_cache = true,
    },
})


-- ==================
-- KEYMAPS
-- ==================

-- Find files
map("n", "<leader>ff", function()
    require("mini.pick").builtin.files({
        tool = "rg",
    })
end, { desc = "Find files" })

-- Recent files
map("n", "<leader>fo", function()
    require("mini.pick").start({
        source = {
            items = vim.v.oldfiles,
            name = "Recent files",
        },
    })
end, { desc = "Recent files" })

-- Buffers
map("n", "<leader>fb", function()
    require("mini.pick").builtin.buffers()
end, { desc = "Find buffers" })
