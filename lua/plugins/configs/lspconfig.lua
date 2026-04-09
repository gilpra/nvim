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
	map("n", "[d", vim.diagnostic.goto_prev, opts("Prev diagnostic"))
	map("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))
	map("n", "<leader>e", vim.diagnostic.open_float, opts("Show diagnostic"))
end

M.on_init = function(client, _)
	if client:supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.capabilities = require("blink.cmp").get_lsp_capabilities()

M.defaults = function()
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

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			M.on_attach(nil, args.buf)
		end,
	})

	vim.lsp.config("*", {
		capabilities = M.capabilities,
		on_init = M.on_init,
	})

	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = vim.api.nvim_get_runtime_file("", true),
				},
				diagnostics = { globals = { "vim" } },
				telemetry = { enable = false },
			},
		},
	})
end

return M
