return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"cssls",
					"jsonls",
					"tailwindcss",
					"emmet_ls",
					-- Removed html, emmet_ls
				},
			})

			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local servers = {
				ts_ls = {
					capabilities = capabilities,
					on_attach = function(client, _)
						client.handlers["textDocument/publishDiagnostics"] = function() end
					end,
				},
				cssls = { capabilities = capabilities },
				jsonls = { capabilities = capabilities },
				tailwindcss = {
					capabilities = capabilities,
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
				biome = {
					capabilities = capabilities,
					cmd = { "biome", "lsp-proxy" },
					filetypes = {
						"css",
						"graphql",
						"html",
						"javascript",
						"javascriptreact",
						"json",
						"jsonc",
						"typescript",
						"typescript.tsx",
						"typescriptreact",
					},
					root_dir = require("lspconfig.util").root_pattern("biome.json", ".git"),
					single_file_support = false,
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
