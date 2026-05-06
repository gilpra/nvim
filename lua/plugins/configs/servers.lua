-- lua/plugins/configs/servers.lua
--
-- Daftar LSP (Language Server Protocol) server yang akan:
-- 1. Diinstall otomatis oleh mason saat pertama kali setup
-- 2. Dikonfigurasi dan diaktifkan oleh nvim-lspconfig
--
-- LSP server adalah program terpisah yang berjalan di background dan memberikan
-- Neovim kemampuan seperti: autocomplete, go-to-definition, rename, dll.
--
-- Format: nama_server = { ...konfigurasi_tambahan }
-- Server tanpa konfigurasi khusus cukup tulis: nama_server = {}

return {
	-- Lua language server
	-- FIX: Ditambahkan ke sini agar mason otomatis menginstallnya
	-- Konfigurasi detail (settings) ada di lspconfig.lua karena butuh banyak opsi
	-- Di sini cukup daftarkan namanya agar masuk ke ensure_installed
	lua_ls = {},

	-- JSON: validasi struktur, autocomplete key dari JSON Schema
	jsonls = {},

	-- Bash/Shell: autocomplete, hover docs untuk perintah shell
	bashls = {},

	-- HTML language server
	-- snippetSupport = false agar tidak overlap dengan emmet_ls
	-- (keduanya punya HTML completion — tanpa ini ada duplikat di popup)
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

	-- Emmet: shorthand expansion untuk HTML/CSS
	-- Contoh: "div.class>p" → expand jadi full HTML dengan Enter
	-- Dibatasi hanya ke filetype yang relevan
	emmet_ls = {
		filetypes = {
			"html",
			"css",
			"scss",
			"javascriptreact",
			"typescriptreact",
		},
	},

	-- CSS language server: autocomplete property, value, validasi
	cssls = {},

	-- TypeScript/JavaScript language server
	ts_ls = {},

	-- Python language server dengan type checking
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
