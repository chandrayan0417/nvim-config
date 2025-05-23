-- plugins/lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"html",
					"cssls",
					"jsonls",
					"emmet_ls",
					"tailwindcss",
				},
			})

			local lspconfig = require("lspconfig")

			local servers = {
				ts_ls = {
					on_attach = function(client, bufnr)
						-- ❗ Disable tsserver diagnostics (handled by eslint_d instead)
						client.handlers["textDocument/publishDiagnostics"] = function() end
					end,
				},
				html = {},
				cssls = {},
				jsonls = {},
				emmet_ls = {
					filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
				},
				tailwindcss = {
					filetypes = {
						"html",
						"css",
						"scss",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
					},
				},
			}

			for name, opts in pairs(servers) do
				lspconfig[name].setup(opts)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local map = vim.keymap.set
					local opts = { buffer = bufnr }

					map("n", "gd", vim.lsp.buf.definition, opts)
					map("n", "K", vim.lsp.buf.hover, opts)
					map("n", "gi", vim.lsp.buf.implementation, opts)
					map("n", "<leader>rn", vim.lsp.buf.rename, opts)
					map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					map("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
}
