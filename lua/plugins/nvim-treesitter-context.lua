-- nvim/lua/plugins/nvim-treesitter-context.lua
return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  -- ファイルを開いた時に読み込む
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("treesitter-context").setup({
      -- プラグインを有効化
      enable = true,
      -- 表示する行数の上限 (0は無制限)
      max_lines = 0,
      -- ウィンドウの高さがこれ以下の場合は無効化
      min_window_height = 20,
      -- 行番号を表示
      line_numbers = true,
      -- 複数行のコンテキストの最大行数
      multiline_threshold = 1,
      -- 上限を超えた場合に削除するスコープ ('inner' or 'outer')
      trim_scope = 'outer',
      -- コンテキストの計算基準 ('cursor' or 'topline')
      mode = 'cursor',
      -- コンテキストとコードの境界線 (例: '-' や '─')、nilなら境界線なし
      separator = nil,
      -- 表示優先度 (Z-index)
      zindex = 20,
      -- 特定のバッファで無効化する場合に関数を設定
      on_attach = nil,
    })
  end,
}
