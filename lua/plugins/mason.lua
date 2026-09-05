local M = {}

function M.setup()
	require("mason").setup({
		-- System/user-managed binaries have priority over Mason binaries.
		PATH = "append",
	})

	vim.api.nvim_create_user_command("MasonInstallAll", function()
		require("configs.mason_packages").install_all()
	end, {
		desc = "Install all configured Mason packages",
	})
end

return M
