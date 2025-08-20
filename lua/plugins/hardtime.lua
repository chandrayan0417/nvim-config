return {
	"m4xshen/hardtime.nvim",
	lazy = false,
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {},
	keys = {
		{ "<leader>h", "", desc = "Hardtime" },
		{ "<leader>he", "<cmd>Hardtime enable<cr>", desc = "Enable" },
		{ "<leader>hd", "<cmd>Hardtime disable<cr>", desc = "Disable" },
		{ "<leader>ht", "<cmd>Hardtime toggle<cr>", desc = "Toggle" },
	},
}
