return {
  { "tiagovla/tokyodark.nvim" },
  { "nvim-tree/nvim-web-devicons", opts = {} },

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
}
