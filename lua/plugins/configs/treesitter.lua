return {
	auto_install = false,
	ensure_installed = {
		"c",
		"lua",
		"markdown",
		"markdown_inline",
		"vim",
		"vimdoc",
		"query",
		"bash",
		"regex",
	},
	highlight = {
		enable = true,
		disable = function(_, bufnr)
			local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
			if ok and stats and stats.size > 100 * 1024 then
				return true
			end
			return false
		end,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "python", "yaml" },
	},
	autotag = { enable = true },
}
