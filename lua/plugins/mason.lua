require("mason").setup({
	-- System/user-managed binaries have priority over Mason binaries.
	PATH = "append",
})

vim.api.nvim_create_user_command("MasonInstallAll", function()
	local registry = require("mason-registry")

	for _, name in ipairs(require("configs.mason-packages")) do
		local package = registry.get_package(name)

		if not package:is_installed() then
			package:install()
		end
	end
end, {
	desc = "Install all configured Mason packages",
})
