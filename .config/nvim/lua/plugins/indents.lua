return {
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			-- This module contains a number of default definitions
			local rainbow_delimiters = require("rainbow-delimiters")

			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				priority = {
					[""] = 110,
					lua = 210,
				},
				highlight = {
					"RainbowDelimiterYellow",
					"RainbowDelimiterCyan",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterRed",
				},
			}
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},

		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f9e2af" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#89dceb" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a6e3a1" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#cba6f7" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89b4fa" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fab387" })
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f38ba8" })
			end)

			vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup({
				scope = {
					highlight = highlight,
					show_start = false,
					show_end = false,
				},
			})

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
}
