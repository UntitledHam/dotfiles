return {
	"nvim-treesitter/nvim-treesitter",
	-- dependencies = { "nvim-treesitter/nvim-treesitter-context" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
