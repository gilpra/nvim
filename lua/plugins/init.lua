return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight-night")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPost",
		opts = function()
			return require("plugins.configs.gitsigns")
		end,
	},

	{
		"wakatime/vim-wakatime",
		event = "BufReadPost",
	},

	{
		"catgoose/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return require("plugins.configs.nvim-colorizer")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return require("plugins.configs.lualine")
		end,
	},

	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		keys = {
			{
				"-",
				"<CMD>Oil<CR>",
				mode = "n",
				desc = "Oil: open file explorer",
			},
		},
		opts = function()
			return require("plugins.configs.oil-nvim")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{
				"<leader>ff",
				"<cmd>Telescope find_files<CR>",
				desc = "Telescope: find files",
			},
			{
				"<leader>fo",
				"<cmd>Telescope oldfiles<CR>",
				desc = "Telescope: recently opened files",
			},
			{
				"<leader>fg",
				"<cmd>Telescope live_grep<CR>",
				desc = "Telescope: search text in project",
			},
			{
				"<leader>gt",
				"<cmd>Telescope git_status<CR>",
				desc = "Telescope: git status",
			},
		},
		opts = {
			extensions_list = { "fzf" },
		},
	},

	{
		"akinsho/bufferline.nvim",
		event = "BufReadPre",
		keys = {
			{
				"<Tab>",
				"<cmd>BufferLineCycleNext<CR>",
				desc = "Buffer: next",
			},
			{
				"<S-Tab>",
				"<cmd>BufferLineCyclePrev<CR>",
				desc = "Buffer: previous",
			},
			{
				"<leader>x",
				"<cmd>bd<CR>",
				desc = "Buffer: close",
			},
			{
				"<leader>ox",
				"<cmd>BufferLineCloseOther<CR>",
				desc = "Buffer: close others",
			},
		},
		opts = function()
			return require("plugins.configs.bufferline")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				opts = { enable_autocmd = false },
			},
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		opts = function()
			vim.g.skip_ts_context_commentstring_module = true
			local get_option = vim.filetype.get_option
			vim.filetype.get_option = function(filetype, option) ---@diagnostic disable-line: duplicate-set-field
				return option == "commentstring"
						and require("ts_context_commentstring.internal").calculate_commentstring()
					or get_option(filetype, option)
			end

			return require("plugins.configs.treesitter")
		end,
	},

	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("plugins.configs.mason").setup()
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local lsp = require("plugins.configs.lspconfig")
			lsp.defaults()

			local servers = require("plugins.configs.servers")
			for name, opts in pairs(servers) do
				vim.lsp.config(name, opts)
				vim.lsp.enable(name)
			end
		end,
	},

	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "*",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				event = "InsertEnter",
				dependencies = {
					"rafamadriz/friendly-snippets",
				},
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				opts = {
					check_ts = true, -- gunakan treesitter untuk context yang lebih akurat
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
			},
		},
		opts = function()
			return require("plugins.configs.blink")
		end,
	},

	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = function()
			return require("plugins.configs.conform")
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		keys = {
			{ "ys", mode = "n", desc = "Surround: add (ysiw=wrap word)" },
			{ "cs", mode = "n", desc = "Surround: change" },
			{ "ds", mode = "n", desc = "Surround: delete" },
			{ "S", mode = "v", desc = "Surround: wrap selection" },
		},
		opts = {},
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = {
			{
				"<A-i>",
				"<cmd>ToggleTerm<CR>",
				mode = { "n", "t" },
				desc = "Terminal: toggle",
			},
			{
				"<A-f>",
				"<cmd>ToggleTerm direction=float<CR>",
				mode = "n",
				desc = "Terminal: floating",
			},
			{
				"<A-h>",
				"<cmd>ToggleTerm direction=horizontal<CR>",
				mode = "n",
				desc = "Terminal: horizontal",
			},
			{
				"<A-v>",
				"<cmd>ToggleTerm direction=vertical<CR>",
				mode = "n",
				desc = "Terminal: vertical",
			},
		},
		opts = function()
			return require("plugins.configs.toggleterm")
		end,
	},

	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>sr",
				"<cmd>Spectre<CR>",
				mode = "n",
				desc = "Spectre: open panel",
			},
			{
				"<leader>sw",
				function()
					require("spectre").open_visual({ select_word = true })
				end,
				mode = "n",
				desc = "Spectre: search word under cursor",
			},
			{
				"<leader>sw",
				function()
					require("spectre").open_visual()
				end,
				mode = "v",
				desc = "Spectre: search selection",
			},
			{
				"<leader>sf",
				function()
					require("spectre").open_file_search({ select_word = true })
				end,
				mode = "n",
				desc = "Spectre: search in current file",
			},
		},
		opts = function()
			return require("plugins.configs.nvim-spectre")
		end,
	},
}
