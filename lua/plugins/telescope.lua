-- nvim/lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Live Grep" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Buffers" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Help Tags" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-project.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
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
