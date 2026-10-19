local M = {
    -- Runner window
    height = 12,

    -- Interpreted languages
    run = {
        python = { "python" },
        lua = { "lua" },
        javascript = { "node" },
        sh = { "bash" },
        bash = { "bash" },
    },

    -- Compiled languages
    compile = {
        c = "gcc {file} -o {output}",
        cpp = "g++ {file} -o {output}",
    },
}

local state = {
    win = nil,
    buf = nil,
    job = nil,
}

-- Save the current file
local function save_file()
    local buf = vim.api.nvim_get_current_buf()
    local file = vim.api.nvim_buf_get_name(buf)

    if file == "" or vim.bo[buf].buftype ~= "" then
        vim.notify("Please open a normal file first.", vim.log.levels.WARN)
        return nil
    end

    if vim.bo[buf].modified then
        local ok, err = pcall(function()
            vim.api.nvim_buf_call(buf, function()
                vim.cmd.write()
            end)
        end)

        if not ok then
            vim.notify("Failed to save file: " .. err, vim.log.levels.ERROR)
            return nil
        end
    end

    return vim.fn.fnamemodify(file, ":p")
end

-- Create the runner buffer
local function create_runner()
    if state.buf and vim.api.nvim_buf_is_valid(state.buf) then
        vim.api.nvim_buf_delete(state.buf, { force = true })
    end

    local existing = vim.fn.bufnr("runner")

    if existing > 0 and vim.api.nvim_buf_is_valid(existing) then
        if vim.bo[existing].buftype ~= "terminal" then
            vim.notify(
                "Buffer 'runner' already exists and is not a terminal.",
                vim.log.levels.ERROR
            )
            return nil
        end

        vim.api.nvim_buf_delete(existing, { force = true })
    end

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_name(buf, "runner")

    vim.bo[buf].buflisted = false
    vim.bo[buf].swapfile = false
    vim.bo[buf].bufhidden = "hide"
    vim.bo[buf].filetype = "runner"

    state.buf = buf
    return buf
end

-- Open the runner window
local function open_runner(buf)
    if not state.win or not vim.api.nvim_win_is_valid(state.win) then
        vim.cmd("botright " .. M.height .. "split")
        state.win = vim.api.nvim_get_current_win()
    end

    vim.api.nvim_win_set_buf(state.win, buf)
    vim.api.nvim_set_current_win(state.win)
end

-- Stop the previous process
local function stop_runner()
    if state.job then
        vim.fn.jobstop(state.job)
        state.job = nil
    end
end

-- Start a command in the runner terminal
local function start_runner(command, cwd)
    stop_runner()

    local buf = create_runner()
    if not buf then
        return
    end

    open_runner(buf)

    local job = vim.fn.jobstart(command, {
        term = true,
        cwd = cwd,

        on_exit = function(job_id)
            if state.job == job_id then
                state.job = nil
            end
        end,
    })

    if job <= 0 then
        state.job = nil
        vim.notify("Failed to start runner.", vim.log.levels.ERROR)
        return
    end

    state.job = job

    -- Restore the custom name and filetype
    vim.api.nvim_buf_set_name(buf, "runner")
    vim.bo[buf].filetype = "runner"

    vim.cmd.startinsert()
end

-- Run interpreted languages
local function run_interpreted(file, filetype, cwd)
    local command = vim.deepcopy(M.run[filetype])
    table.insert(command, file)

    start_runner(command, cwd)
end

-- Compile and run compiled languages
local function compile_and_run(file, filetype, cwd)
    local template = M.compile[filetype]
    local source = vim.fn.fnamemodify(file, ":t")
    local output = vim.fn.fnamemodify(file, ":t:r")

    -- Show actual filenames in the prompt
    local default = template
        :gsub("{file}", source)
        :gsub("{output}", output)

    vim.ui.input({
        prompt = "Compile command: ",
        default = default,
    }, function(input)
        if not input or vim.trim(input) == "" then
            return
        end

        -- Run the binary only if compilation succeeds
        start_runner({
            "bash",
            "-c",
            input .. " && exec " .. vim.fn.shellescape("./" .. output),
        }, cwd)
    end)
end

-- Main function
local function run_file()
    local file = save_file()
    if not file then
        return
    end

    local filetype = vim.bo.filetype
    local cwd = vim.fn.fnamemodify(file, ":h")

    if M.run[filetype] then
        run_interpreted(file, filetype, cwd)
    elseif M.compile[filetype] then
        compile_and_run(file, filetype, cwd)
    else
        vim.notify(
            "No run/compile command configured for: " .. filetype,
            vim.log.levels.WARN
        )
    end
end

vim.keymap.set("n", "<leader>r", run_file, {
    desc = "Compile and run file",
})
