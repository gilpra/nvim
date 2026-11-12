require("diffview").setup({
    use_icons = false,
    enhanced_diff_hl = true,
    watch_index = true,
})

-- Keymap
vim.keymap.set("n", "zz", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
