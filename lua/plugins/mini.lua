local map = vim.keymap.set

-- Auto pairs
require("mini.pairs").setup()

-- Enhanced a/i
require("mini.ai").setup()

-- Enhanced surround
require("mini.surround").setup()

-- Icon
require("mini.icons").setup()

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
})

-- Completion
local completion = require("mini.completion")

-- Process LSP completion items before displaying them.
local function process_completion_items(items, base)
	-- Create a copy to avoid modifying the original completion items.
	items = vim.deepcopy(items)

	for _, item in ipairs(items) do
		local label_details = item.labelDetails
		local signature = label_details and label_details.detail

		-- Move the function signature from labelDetails.detail to item.detail.
		if type(signature) == "string" and signature ~= "" then
			-- Preserve existing detail information when appending the signature.
			item.detail = item.detail and (item.detail .. "\n" .. signature) or signature

			-- Remove the signature from the completion label.
			label_details.detail = nil

			-- Remove labelDetails if it no longer contains any information.
			if vim.tbl_isempty(label_details) then
				item.labelDetails = nil
			end
		end
	end

	-- Use the default processing to preserve built-in filtering and sorting.
	return completion.default_process_items(items, base)
end

completion.setup({
	delay = {
		completion = 100,
		info = 300,
		signature = 100,
	},
	window = {
		info = { border = "single" },
		signature = { border = "single" },
	},
	lsp_completion = {
		process_items = process_completion_items,
	},
})

-- Make mini.snippets available as an LSP completion source.
require("mini.snippets").start_lsp_server()

-- Completion and snippet navigation
local function has_snippet_session()
	local session = MiniSnippets.session.get()
	return session and session.buf_id == vim.api.nvim_get_current_buf()
end

map("i", "<Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-n>"
	end

	if has_snippet_session() then
		MiniSnippets.session.jump("next")
		return ""
	end

	return "<Tab>"
end, { expr = true, desc = "Next completion or snippet tabstop" })

map("i", "<S-Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-p>"
	end

	if has_snippet_session() then
		MiniSnippets.session.jump("prev")
		return ""
	end

	return "<S-Tab>"
end, { expr = true, desc = "Previous completion or snippet tabstop" })

map("i", "<C-j>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-n>"
	end

	vim.schedule(MiniSnippets.expand)
	return ""
end, { expr = true, desc = "Next completion or expand snippet" })

map("i", "<C-k>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-p>"
	end

	return "<C-k>"
end, { expr = true, desc = "Previous completion" })

map("i", "<CR>", function()
	if vim.fn.complete_info({ "selected" }).selected ~= -1 then
		return "<C-y>"
	end

	return "<CR>"
end, { expr = true, desc = "Accept completion" })

-- ==================
-- KEYMAPS
-- ==================

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
