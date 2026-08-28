local M = {}

local function setup_diagnostics()
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
end

local function setup_keymaps()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			local bufnr = args.buf

			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, {
					buffer = bufnr,
					desc = "LSP " .. desc,
				})
			end

			map("gd", vim.lsp.buf.definition, "Go to definition")
			map("gD", vim.lsp.buf.declaration, "Go to declaration")
			map("gr", vim.lsp.buf.references, "Go to references")
			map("gi", vim.lsp.buf.implementation, "Go to implementation")

			map("K", vim.lsp.buf.hover, "Hover docs")
			map("<leader>rn", vim.lsp.buf.rename, "Rename")
			map("<leader>ca", vim.lsp.buf.code_action, "Code action")
			map("<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
			map("<leader>e", vim.diagnostic.open_float, "Show diagnostic")

			map("]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, "Next diagnostic")

			map("[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, "Previous diagnostic")

			if client and client:supports_method("textDocument/semanticTokens") then
				client.server_capabilities.semanticTokensProvider = nil
			end
		end,
	})
end

function M.setup()
	local capabilities = require("blink.cmp").get_lsp_capabilities()
	local servers = require("configs.servers")

	setup_diagnostics()
	setup_keymaps()

	-- Shared settings for every LSP server.
	vim.lsp.config("*", {
		capabilities = capabilities,
	})

	-- Server-specific settings.
	for name, config in pairs(servers) do
		vim.lsp.config(name, config)
		vim.lsp.enable(name)
	end
end

return M
