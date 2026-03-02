local mode_names = {
	n = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	V = "V-LINE",
	["\22"] = "V-BLOCK",
	c = "COMMAND",
	R = "REPLACE",
	t = "TERMINAL"
}

local mode_colors = {
	n = "white",
	i = "green",
	v = "yellow",
	V = "yellow",
	["\22"] = "yellow",
	c = "red",
	R = "orange",
	t = "navy"
}

local ViModeBlock = {
	static = {
		mode_names = mode_names,
		mode_colors = mode_colors
	},

	init = function(self)
		self.curr_mode = vim.api.nvim_get_mode().mode:sub(1, 1)
	end,

	hl = function(self)
		return { bg = self.mode_colors[self.curr_mode] }	
	end,

	provider = function(self)
		return " " .. self.mode_names[self.curr_mode] .. " "
	end,

	update = {
		"ModeChanged",
		callback = vim.schedule_wrap(function()
			vim.api.nvim__redraw({ statusline = true })
		end)
	}
}

return ViModeBlock
