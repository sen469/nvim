return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
    opts = {
      window = {
        width = 120,  -- 中央に配置するエディタの横幅 (文字数)
        height = 1,   -- 高さは画面いっぱい (制限なし)
      },
      plugins = {
        options = {
          enabled = false, -- 基本的な表示設定を変更しない
        },
        gitsigns = { enabled = true },
        tmux = { enabled = false },
      },
    },
  },
}
