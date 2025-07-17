return {
	-- Autoformat with conform.nvim
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = true,
		formatters_by_ft = {
			lua = { "stylua" },
			["javascript"] = { "biome-check" },
			["javascriptreact"] = { "biome-check" },
			["typescript"] = { "biome-check" },
			["typescriptreact"] = { "biome-check" },
			["json"] = { "biome-check" },
			["css"] = { "biome-check" },
			["html"] = { "biome-check" },
			markdown = { "prettierd" },
		},
		formatters = {
			biome = {
				command = "biome",
				args = {
					"check",
					"--write",
					"--stdin-file-path",
					"$FILENAME",
				},
				stdin = true,
			},
		},
	},
}
