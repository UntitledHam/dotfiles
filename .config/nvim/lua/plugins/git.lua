return {
  "lewis6991/gitsigns.nvim",

  config = function()
    require('gitsigns').setup({

    })
    vim.keymap.set("n", "<leader>gs", ":Gitsigns toggle_signs<CR>")
  end,
}
