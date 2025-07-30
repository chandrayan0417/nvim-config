return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = true }, -- disables ghost text
			panel = { enabled = true }, -- disables Copilot panel
			filetypes = {
				["*"] = true,
			},
		},
	},
}

