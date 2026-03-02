vim.api.nvim_create_user_command("Template", function(opts)
	local cfgdir = vim.fn.stdpath("config")
	vim.cmd("0r " .. cfgdir .. "/templates/" ..  opts.args)
end, { nargs = 1 })
