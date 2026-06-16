return {
  "echasnovski/mini.ai",
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.ai").setup({
      -- 必要に応じてカスタマイズ可能
      n_lines = 500, -- 検索する行数
    })
  end,
}
