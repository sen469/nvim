return {
  -- nvim-surround
  {
    "kylechui/nvim-surround",
    version = "*",        -- 安定版を取得
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- ここに必要なら個別設定
      })
    end,
  },
}
