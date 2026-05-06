return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "personal-notes",
					path = "~/Documents/personal-note",
				},
			},

			link = {
				style = "wiki",
				auto_update = true,
			},

			attachments = {
				folder = "99 metas/assets",
			},

			legacy_commands = false,

			picker = {
				name = "telescope.nvim",
			},

			frontmatter = {
				enabled = false,
			},

			completion = {
				nvim_cmp = false,
				min_chars = 2,
			},

			note_id_func = function(title)
				if title ~= nil then
					return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					return tostring(os.time())
				end
			end,

			daily_notes = {
				folder = "07 dailies",
				date_format = "%Y-%m-%d",
			},

			templates = {
				subdir = "99 metas/templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
			},

			checkbox = {
				enabled = true,
				create_new = true,
				order = { " ", "x", ">", "~" },
			},

			ui = {
				enable = true,
			},
		},

		config = function(_, opts)
			require("obsidian").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					local buf = vim.api.nvim_get_current_buf()
					local fname = vim.api.nvim_buf_get_name(buf)
					local vault_path = vim.fn.expand("~/Documents/personal-note")
					if fname:find(vault_path, 1, true) then
						vim.opt_local.conceallevel = 2
					end
				end,
			})
		end,

		keys = {
			{ "<leader>on", "<cmd>Obsidian new<CR>", desc = "Obsidian: new note" },
			{ "<leader>oo", "<cmd>Obsidian open<CR>", desc = "Obsidian: open in app" },
			{ "<leader>of", "<cmd>Obsidian quick_switch<CR>", desc = "Obsidian: find note" },
			{ "<leader>og", "<cmd>Obsidian search<CR>", desc = "Obsidian: grep vault" },
			{ "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "Obsidian: backlinks" },
			{ "<leader>ot", "<cmd>Obsidian tags<CR>", desc = "Obsidian: tags" },
			{ "<leader>od", "<cmd>Obsidian today<CR>", desc = "Obsidian: daily note" },
			{ "<leader>oT", "<cmd>Obsidian template<CR>", desc = "Obsidian: template" },
			{ "<leader>or", "<cmd>Obsidian rename<CR>", desc = "Obsidian: rename" },
			{ "<leader>ol", "<cmd>Obsidian links<CR>", desc = "Obsidian: list links" },
			{ "<leader>op", "<cmd>Obsidian paste_img<CR>", desc = "Obsidian: paste image" },
			{
				"gf",
				function()
					if require("obsidian").util.cursor_on_markdown_link() then
						return "<cmd>Obsidian follow_link<CR>"
					else
						return "gf"
					end
				end,
				expr = true,
				desc = "Obsidian: follow link or gf",
			},
		},
	},
}
