return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    keywords = {
      ERROR = {
        icon = " ", -- エラー用のアイコン
        color = "error", -- レッド（既定のエラー色）
        alt = { "ERR" }, -- ERR: でも反応するように
      },
    },
  },
  keys = {
    { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo (Telescope)" },
  },
}
