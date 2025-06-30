return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
	},
	{
		"jghauser/follow-md-links.nvim",
		vim.keymap.set("n", "<bs>", ":edit #<cr>", { silent = true }),
	},
	{
		{
			"Kicamon/markdown-table-mode.nvim",
			config = function()
				require("markdown-table-mode").setup()
			end,
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
