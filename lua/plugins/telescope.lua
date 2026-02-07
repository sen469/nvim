-- nvim/lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-project.nvim",
  },
  config = function()
    local telescope = require("telescope")
    
    telescope.setup({
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
      extensions = {
        project = {
          base_dirs = {
            "~/src",
            "~/my",
          },
          hidden_files = true,
          theme = "dropdown",
          order_by = "asc",
          search_by = "title",
          sync_with_nvim_tree = false,
        }
      }
    })

    telescope.load_extension("project")
  end
}
