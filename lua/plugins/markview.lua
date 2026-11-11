local presets = require("markview.presets")

require("markview").setup({
    preview = {
        enabled = true,
        -- mini.icons sudah dipakai di plugins/mini.lua
        icon_provider = "mini",
        filetypes = { "markdown" },
        ignore_buftypes = { "nofile" },
        modes = { "n", "no", "c", "i" },
        debounce = 100,
        max_buf_lines = 1500,
    },

    markdown = {
        headings = presets.headings.marker,
        horizontal_rules = presets.horizontal_rules.thin,
        tables = presets.tables.rounded,

        list_items = {
            indent_size = 2,
            shift_width = 2,
        },

        code_blocks = {
            style = "block",
            min_width = 60,
            pad_amount = 3,
        },
    },
})


-- Checkbox Toggle
require("markview.extras.checkboxes").setup({
    default = "X",
    remove_style = "disable",
})

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("UserMarkview", { clear = true }),
    pattern = "markdown",
    callback = function(args)
        local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, {
                buffer = args.buf,
                desc = desc,
            })
        end

        map("<leader>ms", "<cmd>Markview splitToggle<CR>", "Markview: toggle splitview")

        -- Toggle checkbox pada baris cursor.
        vim.keymap.set("n", "<CR>", "<cmd>Checkbox toggle<CR>", {
            buffer = args.buf,
            silent = true,
            desc = "Markview: Toggle checkbox",
        })

        -- Toggle checkbox pada seluruh baris yang dipilih.
        vim.keymap.set("x", "<CR>", ":Checkbox toggle<CR>", {
            buffer = args.buf,
            silent = true,
            desc = "Markview: Toggle selected checkboxes",
        })
    end,
})
