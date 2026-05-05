return {
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,

	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_inserted = true,
	persist_size = true,
	close_on_exit = true,
	auto_scroll = true,

	direction = "float",

	float_opts = {
		border = "curved",
		width = function()
			return math.floor(vim.o.columns * 0.8) -- 80% lebar layar
		end,
		height = function()
			return math.floor(vim.o.lines * 0.8) -- 80% tinggi layar
		end,
		winblend = 10, -- sedikit transparansi
	},

	highlights = {
		FloatBorder = { link = "FloatBorder" },
		NormalFloat = { link = "NormalFloat" },
	},
}
