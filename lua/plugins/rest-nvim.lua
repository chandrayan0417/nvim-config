return {
	"rest-nvim/rest.nvim",
	ft = "http",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				vim.list_extend(opts.ensure_installed, { "http", "json" })
			end,
		},
	},
	keys = {
		{ "<leader>r", name = "Rest", desc = "Rest API" },
		{ "<leader>rr", "<cmd>Rest run<cr>", desc = "Run Request" },
		{ "<leader>rl", "<cmd>Rest last<cr>", desc = "Run Last Request" },
		{ "<leader>ro", "<cmd>Rest open<cr>", desc = "Open Response Window" },
		{ "<leader>re", "<cmd>Rest env show<cr>", desc = "Show .env" },
		{ "<leader>rs", "<cmd>Rest env select<cr>", desc = "Select .env" },
		{ "<leader>rc", "<cmd>Rest cookies<cr>", desc = "Edit Cookies" },
		{ "<leader>rg", "<cmd>Rest logs<cr>", desc = "View Logs" },
	},
}
