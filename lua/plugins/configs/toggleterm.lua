return {
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,

	open_mapping = [[<C-/>]],
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_inserted = true,
	insert_mappings = true,
	persist_size = true,
	close_on_exit = true,
	auto_scroll = true,

	direction = "float", -- "horizontal" | "vertical" | "float" | "tab"

	float_opts = {
		border = "curved", -- "single" | "double" | "shadow" | "curved"
		width = math.floor(vim.o.columns * 0.8),
		height = math.floor(vim.o.lines * 0.8),
		winblend = 10,
	},

	highlights = {
		FloatBorder = { link = "FloatBorder" },
		NormalFloat = { link = "NormalFloat" },
	},
}
