return {

	{
		'maxmx03/solarized.nvim',
		lazy = false,
		priority = 1000,
		---@type solarized.config
		opts = {},
		config = function(_, opts)
			vim.o.termguicolors = true
			vim.o.background = 'light'
			require('solarized').setup(opts)
			vim.cmd.colorscheme 'solarized'
		end
	}
	--[[
	{
		"metalelf0/black-metal-theme-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("black-metal").setup({
				-- optional configuration here
				theme = "bathory",
				variant = "dark"
			})
			require("black-metal").load()
		end
	}
	]]
}
