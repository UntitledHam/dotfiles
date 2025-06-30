return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
    require("catppuccin").setup({
      color_overrides = {
        vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
      },
    })
		vim.cmd.colorscheme("catppuccin")
	end,
}
