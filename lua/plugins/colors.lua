local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
			transparent_background = true,
			integrations = {
				telescope = true,
				treesitter = true,
				gitsigns = true,
				nvimtree = true,
				cmp = true,
				mason = true,
				which_key = true,
				notify = true,
				noice = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
		enable_transparency()
		vim.cmd("hi Directory guibg=NONE")
		vim.cmd("hi SignColumn guibg=NONE")
	end,
}
