local modes = {
    n = { "NORMAL", "StatusLineNormal" },
    i = { "INSERT", "StatusLineInsert" },
    v = { "VISUAL", "StatusLineVisual" },
    V = { "VISUAL", "StatusLineVisual" },
    ["\22"] = { "VISUAL", "StatusLineVisual" },
    R = { "REPLACE", "StatusLineReplace" },
    c = { "COMMAND", "StatusLineCommand" },
    t = { "TERMINAL", "StatusLineCommand" },
}

local function render()
    if vim.bo.filetype == "oil" then
        return " "
    end

    local m = modes[vim.fn.mode()] or modes.n
    local branch = vim.b.gitsigns_head
    local d = vim.diagnostic.count(0)
    local E, W = d[vim.diagnostic.severity.ERROR], d[vim.diagnostic.severity.WARN]

    return table.concat({
        "%#" .. m[2] .. "# " .. m[1] .. " %#StatusLine#",
        branch and branch ~= "" and " │ " .. branch or "",
        E and " │ %#DiagnosticError#E:" .. E .. "%#StatusLine#" or "",
        W and " │ %#DiagnosticWarn#W:" .. W .. "%#StatusLine#" or "",
        " │ %f%m%r",
        "%=",
        "%{&fileformat} │ %{&filetype} │ %l:%c ",
    })
end

_G.StatuslineRender = render

vim.opt.statusline = "%!v:lua.StatuslineRender()"
