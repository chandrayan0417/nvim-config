local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

return {
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd.colorscheme("tokyonight")
			vim.cmd("hi Directory guibg=NONE")
			vim.cmd("hi SignColumn guibg=NONE")
			enable_transparency()
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		name = "vscode",
		config = function()
			vim.cmd.colorscheme("vscode")
			vim.cmd("hi Directory guibg=NONE")
			vim.cmd("hi SignColumn guibg=NONE")
			enable_transparency()
		end,
	},
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	dependencies = {
	-- 		{ "nvim-lua/plenary.nvim" },
	-- 		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", enabled = vim.fn.executable("make") == 1 },
	-- 	},
	-- 	cmd = "Telescope",
	-- 	keys = {
	-- 		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	-- 		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	-- 		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
	-- 		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
	-- 	},
	-- 	opts = {
	-- 		defaults = {
	-- 			layout_config = {
	-- 				horizontal = { preview_width = 0.6 },
	-- 			},
	-- 			file_ignore_patterns = { "node_modules", ".git" },
	-- 		},
	-- 	},
	-- }
}
