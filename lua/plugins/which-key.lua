return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "classic", -- or "modern" / "helix"
    spec = {
      { "<leader>f", group = "find (Telescope)" },
      { "<leader>b", group = "buffer" },
      { "<leader>d", group = "debug" },
      { "<leader>g", group = "git (Diffview)" },
      { "<leader>r", group = "rename/repl" },
      { "<leader>s", group = "search/split" },
      { "s", group = "split/window" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
