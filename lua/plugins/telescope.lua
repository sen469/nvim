return {
  "nvim-telescope/telescope.nvim",
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
