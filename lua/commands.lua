local command = vim.api.nvim_create_user_command

command("MasonInstallAll", function()
	local lsp_map = require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package

	local registry = require("mason-registry")

	local tools = {}

	-- LSP
	for name in pairs(require("configs.servers")) do
		local pkg = lsp_map[name]

		if pkg then
			tools[#tools + 1] = pkg
		end
	end

	-- Formatter dari conform
	local ok, conform = pcall(require, "plugins.conform")

	if ok and conform.opts and conform.opts.formatters_by_ft then
		for _, ft_tools in pairs(conform.opts.formatters_by_ft) do
			if type(ft_tools) == "table" then
				for _, tool in ipairs(ft_tools) do
					if type(tool) == "string" then
						tools[#tools + 1] = tool
					end
				end
			end
		end
	end

	local to_install = vim.tbl_filter(function(pkg)
		local ok_pkg, p = pcall(function()
			return registry.get_package(pkg)
		end)

		return ok_pkg and p and not p:is_installed()
	end, tools)

	if #to_install > 0 then
		vim.cmd("MasonInstall " .. table.concat(to_install, " "))
	else
		print("All tools already installed")
	end
end, {})
