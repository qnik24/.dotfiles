local actions = require("telescope.actions")

return {
	-- insert mode
	i = {
		["<C-j>"] = function() vim.cmd("stopinsert") end
	},
	
	-- normal mode
	n = {
		["<C-j>"] = actions.close
	}
}
