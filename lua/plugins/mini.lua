-- Auto pairs
require("mini.pairs").setup()

-- Enhanced a/i
require("mini.ai").setup()

-- Enhanced surround
require("mini.surround").setup()

-- Icon
require("mini.icons").setup()
require("mini.icons").tweak_lsp_kind()

-- Picker
require("mini.pick").setup({
	options = {
		use_cache = true,
	},
})

-- Snippet
require("mini.snippets").setup({
	snippets = {
		require("mini.snippets").gen_loader.from_lang(),
	},
	mappings = { expand = "", jump_next = "", jump_prev = "" },
})
require("mini.snippets").start_lsp_server({ match = false })

-- Completion
require("mini.completion").setup({
	lsp_completion = {
		source_func = "omnifunc",
		auto_setup = false,
		process_items = function(items, base)
			local processed = MiniCompletion.default_process_items(items, base, {
				filtersort = "fuzzy",
				kind_priority = { Text = -1 },
			})
			for _, item in ipairs(processed) do
				item.labelDetails = nil
			end
			return processed
		end,
	},
})

-- Keymap
local map_multistep = require("mini.keymap").map_multistep
local map = vim.keymap.set

map_multistep("i", "<Tab>", {
	"minisnippets_next",
	"pmenu_next",
})
map_multistep("i", "<S-Tab>", {
	"minisnippets_prev",
	"pmenu_prev",
})
map_multistep("i", "<C-j>", { "pmenu_next" })
map_multistep("i", "<C-k>", { "pmenu_prev" })

-- Find files
map("n", "<leader>ff", function()
	require("mini.pick").builtin.files({
		tool = "rg",
	})
end, { desc = "Find files" })

-- Recent files
map("n", "<leader>fo", function()
	require("mini.pick").start({
		source = {
			items = vim.v.oldfiles,
			name = "Recent files",
		},
	})
end, { desc = "Recent files" })

-- Buffers
map("n", "<leader>fb", function()
	require("mini.pick").builtin.buffers()
end, { desc = "Find buffers" })
