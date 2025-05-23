-- This file configures the tiny-inline-diagnostic.nvim plugin
return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy", -- Or `LspAttach` if you only want diagnostics when LSP is ready
	priority = 1000, -- Needs to be loaded early to take effect
	config = function()
		require("tiny-inline-diagnostic").setup({
			-- === Default configuration (you can customize these) ===
			preset = "simple", -- Style preset for diagnostic messages

			transparent_bg = false, -- Set the background of the diagnostic to transparent
			transparent_cursorline = false, -- Set the background of the cursorline to transparent

			hi = {
				error = "DiagnosticError", -- Highlight group for error messages
				warn = "DiagnosticWarn", -- Highlight group for warning messages
				info = "DiagnosticInfo", -- Highlight group for informational messages
				hint = "DiagnosticHint", -- Highlight group for hint or suggestion messages
				arrow = "NonText", -- Highlight group for diagnostic arrows
				background = "CursorLine", -- Background color for diagnostics
				mixing_color = "None", -- Color blending option
			},

			options = {
				show_source = { -- Display the source of the diagnostic (e.g., eslint, tsserver)
					enabled = false,
					if_many = false,
				},
				use_icons_from_diagnostic = false, -- Use icons defined in the diagnostic configuration
				set_arrow_to_diag_color = false, -- Set the arrow icon to the same color as the first diagnostic severity
				add_messages = true, -- Add messages to diagnostics when multiline diagnostics are enabled
				throttle = 20, -- Time (in milliseconds) to throttle updates
				softwrap = 30, -- Minimum message length before wrapping to a new line
				multilines = {
					enabled = false,
					always_show = false,
				},
				show_all_diags_on_cursorline = true, -- Display all diagnostic messages on the cursor line
				enable_on_insert = false, -- Enable diagnostics in Insert mode
				enable_on_select = false, -- Enable diagnostics in Select mode

				overflow = {
					mode = "wrap",
					padding = 0,
				},
				break_line = {
					enabled = false,
					after = 30,
				},
				format = nil, -- Custom format function for diagnostic messages
				virt_texts = {
					priority = 2048,
				},
				severity = {
					vim.diagnostic.severity.ERROR,
					vim.diagnostic.severity.WARN,
					vim.diagnostic.severity.INFO,
					vim.diagnostic.severity.HINT,
				},
				overwrite_events = nil,
			},
			disabled_ft = {}, -- List of filetypes to disable the plugin
		})

		-- This is often added to disable Neovim's default virtual text if tiny-inline-diagnostic handles it
		vim.diagnostic.config({ virtual_text = false })
	end,
}
