return {
	{
		"saghen/blink.cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets" },
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			snippets = { preset = "luasnip" },

			keymap = {
				preset = "default",

				["<Tab>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},

				["<S-Tab>"] = { "snippet_backward", "fallback" },

				["<CR>"] = { "fallback" }, -- disables acceptance on Enter

				["<C-Space>"] = { "show" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			signature = {
				enabled = true,
			},

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
				menu = {
					auto_show = true,
					draw = {
						treesitter = { "lsp" },
						columns = {
							{ "kind_icon", "label", "label_description", gap = 1 },
							{ "kind" },
						},
					},
				},
			},

			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
			},

			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},

		opts_extend = { "sources.default" },
	},
}
