local M = {}
local map = vim.keymap.set

M.on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gr", vim.lsp.buf.references, opts("Go to references"))
	map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
	map("n", "K", vim.lsp.buf.hover, opts("Hover docs"))
	map("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
	map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
	map("n", "<leader>ds", vim.lsp.buf.document_symbol, opts("Document symbols"))
	map("n", "<leader>e", vim.diagnostic.open_float, opts("Show diagnostic"))
end

M.on_init = function(client, _)
	if client:supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.defaults = function()
	local capabilities = require("blink.cmp").get_lsp_capabilities()

	vim.diagnostic.config({
		virtual_text = { prefix = "●" },
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			border = "rounded",
			source = true,
		},
	})

	local lsp_group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true })

	vim.api.nvim_create_autocmd("LspAttach", {
		group = lsp_group,
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			M.on_attach(client, args.buf)
		end,
	})

	-- Wildcard: capabilities dan on_init untuk semua server
	vim.lsp.config("*", {
		capabilities = capabilities,
		on_init = M.on_init,
	})
end

return M
