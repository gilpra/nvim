-- Mapping nama server (lspconfig, dipakai di configs/servers.lua) ->
-- nama package Mason. Ini satu-satunya tempat yang perlu diupdate saat
-- menambah/menghapus LSP server, supaya "packages" untuk MasonInstallAll
-- selalu sinkron dengan configs/servers.lua tanpa perlu dijaga manual
-- di dua tempat berbeda.
local server_to_mason_package = {
	lua_ls = "lua-language-server",
	jsonls = "json-lsp",
	bashls = "bash-language-server",
	html = "html-lsp",
	emmet_ls = "emmet-ls",
	cssls = "css-lsp",
	ts_ls = "typescript-language-server",
	pyright = "pyright",
	clangd = "clangd",
}

-- Package yang bukan LSP server (formatter, dll) tetap didaftarkan manual
-- di sini karena tidak punya representasi di configs/servers.lua.
local extra_packages = {
	"stylua",
	"black",
	"shfmt",
	"prettier",
	"clang-format",
}

return {
	"williamboman/mason.nvim",

	cmd = {
		"Mason",
		"MasonInstall",
		"MasonInstallAll",
		"MasonUpdate",
		"MasonUninstall",
	},

	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"neovim/nvim-lspconfig",
	},

	config = function()
		require("mason").setup({
			PATH = "prepend",
		})

		local servers = require("configs.servers")

		-- Bangun daftar package Mason dari server yang benar-benar
		-- terdaftar di configs/servers.lua + extra_packages (formatter).
		local packages = vim.deepcopy(extra_packages)
		for name, _ in pairs(servers) do
			local pkg = server_to_mason_package[name]
			if pkg then
				table.insert(packages, pkg)
			else
				vim.notify(
					"Server '" .. name .. "' tidak punya mapping Mason package di mason.lua",
					vim.log.levels.WARN
				)
			end
		end

		vim.api.nvim_create_user_command("MasonInstallAll", function()
			vim.cmd("MasonInstall " .. table.concat(packages, " "))
		end, {
			desc = "Install all configured Mason packages",
		})

		local lsp = require("configs.lspconfig")
		lsp.defaults()

		for name, opts in pairs(servers) do
			vim.lsp.config(name, opts)
			vim.lsp.enable(name)
		end
	end,
}
