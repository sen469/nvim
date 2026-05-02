return {
  "rcarriga/nvim-notify",
  opts = {
    background_colour = "#000000",
    max_width = 40,      -- 幅を制限
    render = "compact", -- よりコンパクトな表示形式を使用
    stages = "fade",    -- フェードアニメーション
    timeout = 3000,     -- 表示時間を3秒に短縮
  },
  config = function(_, opts)
    require("notify").setup(opts)
    vim.notify = require("notify")
  end,
}
