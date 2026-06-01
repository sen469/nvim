return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 1, -- 背景の暗転を無効化（1で通常時と同じ）
        width = 120,  -- 中央の幅（お好みに合わせて調整してください）
        height = 1,   -- 高さを最大（100%）に固定
        options = {
          -- ここを空にすることで、行番号などのバッファローカルな設定を維持します
        },
      },
      plugins = {
        options = {
          enabled = false, -- ステータスラインやタブラインを隠す機能を無効化
        },
        twilight = { enabled = false }, -- 周囲を暗くする機能を無効化
        gitsigns = { enabled = true },  -- Gitのサインを表示したままにする
      },
    },
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode (Center only)" },
    },
  },
}
