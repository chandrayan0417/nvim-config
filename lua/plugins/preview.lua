return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			render_modes = { "n", "c", "t" },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		keys = {
			{
				"<leader>mp",
				ft = "markdown",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
			},
		},
		init = function()
			-- The default filename is 「${name}」and I just hate those symbols
			vim.g.mkdp_page_title = "${name}"
		end,
	},
}
