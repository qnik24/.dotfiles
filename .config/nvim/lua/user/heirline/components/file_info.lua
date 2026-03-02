local cond = require("heirline.conditions")
local utils = require("heirline.utils")

local FileNameBlock = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end
}

local FileNameText = {
	provider = function(self)
		local filename = vim.fn.fnamemodify(self.filename, ":.") -- get the relative path

		-- if an unnamed buffer
		if filename == "" then
			return "  [Unnamed Buffer] "
		end

		-- if the space is limited, specifically above 1/2 of width
		if not cond.width_percent_below(#filename, 0.4) then
			filename = vim.fn.pathshorten(filename)
		end

		-- you have to have manual padding
		-- kinda stupid ngl
		return "  " .. filename .. " "
	end,

	hl = { fg = "white" }
}

local FileFlags = {
	-- if the buffer is read-only
	{
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = "[Read-Only]",
		hl = { fg = "orange" }
	},

	-- if buffer changed add a [+] at the end
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = "[+]",
		hl = { fg = "green" }
	},
}

FileNameBlock = utils.insert(FileNameBlock, 
	FileNameText, 
	FileFlags,  
	{ provider = "%<" } 
)

return FileNameBlock
