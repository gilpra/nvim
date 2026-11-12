local function render()
    local items = {}
    local current = vim.api.nvim_get_current_buf()

    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[bufnr].buflisted then
            local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
            name = name ~= "" and name or "[No Name]"

            local highlight = bufnr == current and "%#TabLineSel#" or "%#TabLine#"
            table.insert(items, highlight .. " " .. name .. " ")
        end
    end

    return table.concat(items, "%#TabLineFill#│") .. "%#TabLineFill#"
end

_G.TablineRender = render

vim.opt.showtabline = 2
vim.o.tabline = "%!v:lua.TablineRender()"
