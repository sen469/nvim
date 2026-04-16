return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = { "<leader>ff", "<leader>fg", "<leader>fb", "<leader>fh" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = "❯ ",
        path_display = { "smart" },
        layout_config = {
          horizontal = {
            preview_width = 0.55,
          },
        },
      },
    })
  end
}
