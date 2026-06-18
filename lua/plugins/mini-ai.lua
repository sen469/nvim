return {
  "echasnovski/mini.ai",
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.ai").setup({
      -- 必要に応じてオプションをここに追加できます
      -- デフォルトでも十分に強力なテキストオブジェクトを提供します
    })
  end,
}
