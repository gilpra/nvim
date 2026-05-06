return {
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
						"${3rd}/luv/library",
					},
				},
				diagnostics = { globals = { "vim" } },
				telemetry = { enable = false },
			},
		},
	},
	jsonls = {},
	bashls = {},
	html = {
		capabilities = {
			textDocument = {
				completion = {
					completionItem = {
						snippetSupport = false,
					},
				},
			},
		},
	},
	emmet_ls = {
		filetypes = {
			"html",
			"css",
			"scss",
			"javascriptreact",
			"typescriptreact",
		},
	},
	cssls = {},
	ts_ls = {},
	pyright = {
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "basic",
				},
			},
		},
	},
}
