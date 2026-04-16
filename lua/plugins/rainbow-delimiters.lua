-- nvim/lua/plugins/rainbow-delimiters.lua
return {
  "HiPhish/rainbow-delimiters.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
  end,
}
