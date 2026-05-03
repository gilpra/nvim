local function is_large(bufnr)
	local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
	if not ok or not stats then
		return false
	end
	local max_filesize = 300 * 1024 -- 300 KB
	return stats.size > max_filesize
end

local function disable_ts(lang, bufnr)
	if lang == "json" then
		return true
	end

	if is_large(bufnr) then
		return true
	end

	return false
end

return {
	auto_install = false,

	ensure_installed = {
		"c",
		"lua",
		"json",
		"markdown",
		"markdown_inline",
		"vim",
		"vimdoc",
		"query",
		"bash",
		"regex",
		"html",
		"css",
		"javascript",
		"python",
	},

	highlight = {
		enable = true,
		disable = disable_ts,
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true,
		disable = disable_ts,
	},

	autotag = {
		enable = true,
	},
}
