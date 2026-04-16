return {
  "sen469/restore-cursor.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("restore_cursor").setup()
  end,
}
