local M = {} -- M, for Module

function M.setup()
	-- load the general use keymaps
	require("user.telescope.gen_keymaps")

	require("telescope").setup({
		defaults = {
			mappings = require("user.telescope.mappings")
		},
		pickers = {},
		extensions = {}
	})
end

return M
