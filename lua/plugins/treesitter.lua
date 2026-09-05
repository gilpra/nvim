local M = {}

function M.setup()
	local ts = require("nvim-treesitter")

	ts.setup()
	ts.install(require("configs.language"))
end

return M
