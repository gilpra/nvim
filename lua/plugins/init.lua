return {

	-- =========================
	-- CORE
	-- =========================

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
			return require("plugins.configs.treesitter").opts
		end,
	},

	{
		"williamboman/mason.nvim",
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

	-- =========================
	-- LSP UI / DIAGNOSTICS
	-- =========================

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		keys = {
			{
				"<leader>tt",
				"<cmd>Trouble diagnostics toggle<CR>",
				desc = "Trouble: all diagnostics",
			},
			{
				"<leader>td",
				"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
				desc = "Trouble: current file diagnostics",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle<CR>",
				desc = "Trouble: symbols (code outline)",
			},
			{
				"<leader>tl",
				"<cmd>Trouble lsp toggle<CR>",
				desc = "Trouble: LSP panel",
			},
			{
				"<leader>tq",
				"<cmd>Trouble qflist toggle<CR>",
				desc = "Trouble: quickfix list",
			},
		},
		opts = {
			modes = {
				diagnostics = {
					auto_close = true,
				},
			},
		},
	},

	-- =========================
	-- COMPLETION & EDITING
	-- =========================

	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "*",
		dependencies = {
			{
				"rafamadriz/friendly-snippets",
				{
					"L3MON4D3/LuaSnip",
					event = "InsertEnter",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
				{
					"windwp/nvim-autopairs",
					opts = {
						check_ts = true,
						disable_filetype = { "TelescopePrompt", "vim" },
					},
				},
			},
		},
		opts = function()
			return require("plugins.configs.blink")
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		keys = {
			{ "ys", mode = "n", desc = "Surround: add" },
			{ "cs", mode = "n", desc = "Surround: change" },
			{ "ds", mode = "n", desc = "Surround: delete" },
			{ "S", mode = "v", desc = "Surround: wrap selection" },
		},
		opts = {},
	},

	-- =========================
	-- FORMATTER
	-- =========================

	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = function()
			return require("plugins.configs.conform")
		end,
	},

	-- =========================
	-- SEARCH & NAVIGATION
	-- =========================

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
			{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
			{ "<leader>gt", "<cmd>Telescope git_status<CR>", desc = "Git status" },
		},
		config = function()
			require("plugins.configs.telescope").setup()
		end,
	},

	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>sr", "<cmd>Spectre<CR>", desc = "Spectre panel" },
			{
				"<leader>sw",
				function()
					require("spectre").open_visual({ select_word = true })
				end,
				mode = "n", -- tambah mode eksplisit
				desc = "Search word under cursor",
			},
			{
				"<leader>sw",
				function()
					require("spectre").open_visual()
				end,
				mode = "v",
				desc = "Search selection",
			},
			{
				"<leader>sf",
				function()
					require("spectre").open_file_search({ select_word = true })
				end,
				desc = "Search in current file",
			},
		},
		opts = function()
			return require("plugins.configs.nvim-spectre")
		end,
	},

	-- =========================
	-- FILE EXPLORER
	-- =========================

	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		keys = {
			{ "-", "<CMD>Oil<CR>", desc = "Open explorer" },
		},
		opts = function()
			return require("plugins.configs.oil-nvim")
		end,
	},

	-- =========================
	-- GIT & TRACKING
	-- =========================

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

	-- =========================
	-- UI & VISUAL
	-- =========================

	{
		name = "minimal_night",
		dir = vim.fn.stdpath("config"),
		priority = 1000,
		lazy = false,

		config = function()
			vim.cmd.colorscheme("minimal_night")
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
		"akinsho/bufferline.nvim",
		event = "BufReadPre",
		keys = {
			{ "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
			{ "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
			{ "<leader>x", "<cmd>bd<CR>", desc = "Close buffer" },
			{ "<leader>bx", "<cmd>BufferLineCloseOthers<CR>", desc = "Close others" },
		},
		opts = function()
			return require("plugins.configs.bufferline")
		end,
	},

	{
		"catgoose/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			return require("plugins.configs.nvim-colorizer")
		end,
	},

	-- =========================
	-- TERMINAL
	-- =========================

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = {
			{ "<A-i>", "<cmd>ToggleTerm<CR>", mode = { "n", "t" }, desc = "Toggle term" },
			{ "<A-f>", "<cmd>ToggleTerm direction=float<CR>", desc = "Float term" },
			{ "<A-h>", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal term" },
			{ "<A-v>", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Vertical term" },
		},
		opts = function()
			return require("plugins.configs.toggleterm")
		end,
	},

	-- =========================
	-- TMUX
	-- =========================

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
	},
}
