return {
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
