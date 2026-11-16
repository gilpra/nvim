require("render-markdown").setup({
	-- General
	enabled = true,
	render_modes = { "n", "c", "t" },
	debounce = 100,
	preset = "none",
	log_level = "error",
	file_types = { "markdown" },
	max_file_size = 10.0,

	-- Heading
	heading = {
		enabled = true,
		sign = false,

		position = "inline",

		icons = {
			"󰇊 ",
			"󰇋 ",
			"󰇌 ",
			"󰇍 ",
			"󰇎 ",
			"󰇏 ",
		},

		width = "block",
		left_pad = 0,
		right_pad = 1,

		border = false,

		backgrounds = {
			"RenderMarkdownH1Bg",
			"RenderMarkdownH2Bg",
			"RenderMarkdownH3Bg",
			"RenderMarkdownH4Bg",
			"RenderMarkdownH5Bg",
			"RenderMarkdownH6Bg",
		},

		foregrounds = {
			"RenderMarkdownH1",
			"RenderMarkdownH2",
			"RenderMarkdownH3",
			"RenderMarkdownH4",
			"RenderMarkdownH5",
			"RenderMarkdownH6",
		},
	},

	-- Code blocks
	code = {
		enabled = true,
		sign = false,
		conceal_delimiters = true,

		language = true,
		position = "right",
		language_icon = true,
		language_name = true,
		language_info = false,
		language_left = "█",
		language_right = "█",
		language_border = "",

		width = "block",
		left_pad = 1,
		right_pad = 1,

		border = "thin",
		above = "",
		below = "",

		inline = true,
		inline_pad = 1,

		disable_background = { "diff" },
	},

	-- Horizontal separator
	dash = {
		enabled = true,
		icon = "─",
		width = "full",
		left_margin = 0,
	},

	-- Bullet list
	bullet = {
		enabled = true,
		icons = {
			"●",
			"○",
			"◆",
			"◇",
		},
		left_pad = 0,
		right_pad = 0,
	},

	-- Checkbox
	checkbox = {
		enabled = true,
		bullet = false,
		left_pad = 0,
		right_pad = 0,

		unchecked = {
			icon = "󰄱 ",
			highlight = "RenderMarkdownUnchecked",
		},

		checked = {
			icon = " ",
			highlight = "RenderMarkdownChecked",
			scope_highlight = nil,
		},
	},

	-- Blockquote
	quote = {
		enabled = true,
		icon = "▌ ",
		repeat_linebreak = false,
	},

	-- Tables
	pipe_table = {
		enabled = true,
		preset = "double",
		cell = "padded",
		wrap = true,
		grid = false,
		padding = 1,
		min_width = 3,
		border_enabled = true,
	},

	-- Links
	link = {
		enabled = true,
		image = "󰥶 ",
		hyperlink = "󰌹 ",

		wiki = {
			enabled = true,
			icon = "󱗖 ",
			conceal_destination = true,
		},
	},

	-- Inline highlight: ==text==
	inline_highlight = {
		enabled = true,
	},

	-- Indentation
	indent = {
		enabled = false,
	},

	-- LaTeX
	latex = {
		enabled = false,
	},

	-- Sign column
	sign = {
		enabled = false,
	},
})

-- Custom render-markdown highlights
local function set_markdown_highlights()
	-- Heading colors
	local heading_colors = {
		"#B9D1F2", -- H1: Blue
		"#A9E0D8", -- H2: Cyan
		"#BDE59F", -- H3: Green
		"#D5B5E8", -- H4: Purple
		"#E9B58D", -- H5: Orange
		"#B8B8B8", -- H6: Muted
	}

	for level, color in ipairs(heading_colors) do
		-- Heading icon
		vim.api.nvim_set_hl(0, "RenderMarkdownH" .. level, {
			fg = color,
			bold = true,
		})

		-- Heading background
		vim.api.nvim_set_hl(0, "RenderMarkdownH" .. level .. "Bg", {
			bg = "#202020",
		})

		-- Heading text (Tree-sitter)
		vim.api.nvim_set_hl(0, "@markup.heading." .. level .. ".markdown", {
			fg = color,
			bold = true,
		})
	end

	-- Code block background
	vim.api.nvim_set_hl(0, "RenderMarkdownCode", {
		bg = "#202020",
	})

	-- Code block border
	vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", {
		fg = "#FFFFFF",
		bg = "#202020",
	})

	-- Inline code
	vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", {
		fg = "#A9E0D8",
		bg = "#202020",
	})
end

-- Apply highlights
set_markdown_highlights()

-- Reapply after changing colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_markdown_highlights,
	desc = "Custom Yoruakari Markdown highlights",
})
