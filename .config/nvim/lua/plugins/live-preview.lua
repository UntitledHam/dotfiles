return {
  "brianhuster/live-preview.nvim",
  dependencies = {
    -- You can choose one of the following pickers
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
    "echasnovski/mini.pick",
  },

  config = function()
    require("livepreview.config").set({
      port = 5500,
      browser = "floorp",
      dynamic_root = false,
      sync_scroll = true,
      picker = "",
      vim.api.nvim_set_keymap('n', '<leader>v', ':LivePreview start<CR>', { noremap = true, silent = true })
    })
  end,
}
