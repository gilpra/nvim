return {
	lua_ls = {},
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
					typeCheckingMode = "basic", -- "off" | "basic" | "strict"
				},
			},
		},
	},
}
