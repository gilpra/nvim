local config = {
    height = 15,

    languages = {
        -- Interpreted languages
        python = {
            cmd = "python {file}",
        },
        lua = {
            cmd = "lua {file}",
        },
        javascript = {
            cmd = "node {file}",
        },
        sh = {
            cmd = "bash {file}",
        },
        bash = {
            cmd = "bash {file}",
        },

        -- Compiled languages
        c = {
            cmd = "gcc {file} -o {output}",
            compile = true,
        },
        cpp = {
            cmd = "g++ {file} -o {output}",
            compile = true,
        },
    },

    -- Keymaps disabled in runner buffer
    runner = {
        disabled_keymaps = {
            { mode = "n", lhs = "<Tab>" },
            { mode = "n", lhs = "<S-Tab>" },
            { mode = "n", lhs = "<leader>bd" },
        },
    },
}

local runner = {
    buf = nil,
    win = nil,
    job = nil,
}

local api = vim.api
local fn = vim.fn
local levels = vim.log.levels

-- Scripts
local RUN_SCRIPT = [[
printf '$%s\n' "$1"
exec bash -c "$1"
]]

local COMPILE_SCRIPT = [[
printf '$%s\n' "$1"

start=${EPOCHREALTIME/./}
bash -c "$1"
status=$?
elapsed=$(( (${EPOCHREALTIME/./} - start + 5000) / 10000 ))

if (( status == 0 )); then
    printf 'Compilation finished in %d,%02ds\n\n' $((elapsed / 100)) $((elapsed % 100))
    exec "./$2"
fi

printf 'Compilation failed in %d,%02ds\n\n' $((elapsed / 100)) $((elapsed % 100))
exit "$status"
]]

-- Utilities
local function notify(message, level)
    vim.notify(message, level or levels.INFO)
end

local function valid_buf(buf)
    return buf and api.nvim_buf_is_valid(buf)
end

local function valid_win(win)
    return win and api.nvim_win_is_valid(win)
end

local function disable_runner_keymaps(buf)
    for _, mapping in ipairs(config.runner.disabled_keymaps) do
        vim.keymap.set(mapping.mode, mapping.lhs, "<Nop>", {
            buffer = buf,
            silent = true,
        })
    end
end

-- Source file
local function get_source()
    local buf = api.nvim_get_current_buf()

    if vim.bo[buf].buftype ~= "" then
        notify("Please open a normal file first.", levels.WARN)
        return
    end

    local file = api.nvim_buf_get_name(buf)
    local filetype = vim.bo[buf].filetype

    if file == "" then
        notify("No file name available.", levels.WARN)
        return
    end

    local ok, err = pcall(api.nvim_buf_call, buf, function()
        vim.cmd("update")
    end)

    if not ok then
        notify("Failed to save file: " .. err, levels.ERROR)
        return
    end

    return fn.fnamemodify(file, ":p"), filetype
end

-- Runner
local function stop_runner()
    if runner.job then
        pcall(fn.jobstop, runner.job)
        runner.job = nil
    end
end

local function open_runner()
    if valid_win(runner.win) then
        api.nvim_set_current_win(runner.win)
    else
        vim.cmd(("botright %dsplit"):format(config.height))
        runner.win = api.nvim_get_current_win()
    end

    local old_buf = runner.buf
    local buf = api.nvim_create_buf(false, true)

    runner.buf = buf
    api.nvim_win_set_buf(runner.win, buf)

    disable_runner_keymaps(buf)

    if valid_buf(old_buf) then
        pcall(api.nvim_buf_delete, old_buf, { force = true })
    end

    return buf
end

local function start_runner(script, args, cwd)
    stop_runner()

    local buf = open_runner()
    local cmd = { "bash", "-c", script, "runner" }

    vim.list_extend(cmd, args)

    local ok, job = pcall(fn.jobstart, cmd, {
        term = true,
        cwd = cwd,

        on_exit = function(job_id)
            if runner.job == job_id then
                runner.job = nil
            end
        end,
    })

    if not ok or not job or job <= 0 then
        notify("Failed to start runner.", levels.ERROR)
        return
    end

    runner.job = job

    -- Rename the terminal buffer
    pcall(api.nvim_buf_set_name, buf, "runner")
    vim.bo[buf].filetype = "runner"

    vim.cmd("startinsert")
end

-- Execution
local function execute_language(file, language, cwd)
    local filename = fn.fnamemodify(file, ":t")
    local output = fn.fnamemodify(file, ":t:r")

    local command = language.cmd:gsub("{(%w+)}", {
        file = fn.shellescape(filename),
        output = fn.shellescape(output),
    })

    vim.ui.input({
        prompt = language.compile and "Compile command: " or "Run command: ",
        default = command,
    }, function(input)
        input = input and vim.trim(input)

        if not input or input == "" then
            return
        end

        if language.compile then
            start_runner(COMPILE_SCRIPT, { input, output }, cwd)
        else
            start_runner(RUN_SCRIPT, { input }, cwd)
        end
    end)
end

-- Main
local function compile_current_file()
    local file, filetype = get_source()

    if not file then
        return
    end

    local language = config.languages[filetype]

    if not language then
        notify(
            "No execution command configured for: " .. filetype,
            levels.WARN
        )
        return
    end

    local cwd = fn.fnamemodify(file, ":h")

    execute_language(file, language, cwd)
end

-- Command
api.nvim_create_user_command("Compile", compile_current_file, {
    desc = "Compile and run current file",
    force = true,
})
