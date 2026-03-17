return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons", -- 任意
    },
    opts = {
      -- 基本
      enabled = true,
      render_modes = { "n", "c", "t" }, -- insertでは無効化（編集しやすくする）

      -- 見出し
      heading = {
        enabled = true,
        sign = false,
        icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
      },

      -- コードブロック
      code = {
        enabled = true,
        sign = false,
        style = "full", -- "block"より視認性高い
      },

      -- リスト
      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },

      -- チェックボックス
      checkbox = {
        enabled = true,
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰱒 " },
      },

      -- 引用
      quote = {
        enabled = true,
        icon = "▋",
      },

      -- 区切り線
      dash = {
        enabled = true,
        icon = "─",
      },

      -- 数式（簡易対応）
      latex = {
        enabled = true,
      },

      -- conceal調整
      conceal = {
        enabled = true,
        level = 2,
      },
    },
  },
}
