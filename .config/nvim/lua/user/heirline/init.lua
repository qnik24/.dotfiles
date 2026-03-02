local M = {}

function M.setup()
	require("heirline").load_colors(require("user.heirline.components.colors")) -- setup color aliases

	require("heirline").setup({
		statusline = require("user.heirline.statusline"),
		winbar = {}, -- empty for now
		tabline = {} -- empty for now
	})
end

return M
