return {
  "petertriho/nvim-scrollbar",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("scrollbar").setup({
      handlers = {
        gitsigns = true,
      },
    })
  end,
}
