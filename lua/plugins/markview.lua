local presets = require("markview.presets")

require("markview").setup({
    preview = {
        enable = false,
        -- mini.icons sudah dipakai di plugins/mini.lua
        icon_provider = "mini",
        filetypes = { "markdown" },
        ignore_buftypes = { "nofile" },
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
    end,
})
