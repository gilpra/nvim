return {
	{
		"tiagovla/tokyodark.nvim",
		event = "VeryLazy",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyodark")
		end,
	},

	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{ "lewis6991/gitsigns.nvim", event = "BufReadPre" },

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return require("plugins.configs.lualine")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		opts = {},
	},

	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"akinsho/bufferline.nvim",
		event = "BufReadPre",
		opts = function()
			return require("plugins.configs.bufferline")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		opts = function()
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
		dependencies = {
			"williamboman/mason.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("plugins.configs.mason")
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
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
			{ "windwp/nvim-autopairs", opts = {} },
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
		event = { "BufReadPre", "BufNewFile" },
		version = "*",
	},

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = function()
			return require("plugins.configs.trouble")
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		cmd = "ToggleTerm",
		opts = function()
			return require("plugins.configs.toggleterm")
		end,
	},
}
