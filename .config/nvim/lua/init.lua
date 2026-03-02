local M = {} -- M, for Module

function M.setup()
	require("heirline").setup({
		statusline = require("user.heirline.statusline")
		winbar = {} -- empty for now
		tabline = {} -- empty for now
	})
end

return M
