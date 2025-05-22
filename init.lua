require("config.options")
require("config.keybinds")
require("config.lazy")

vim.api.nvim_create_autocmd("SwapExists", {
	callback = function(ev)
		vim.v.swapchoice = "e" -- 'e' for edit anyway
	end,
})
