return {
  "stevearc/oil.nvim",
  opts = {
    -- デフォルトのファイルエクスプローラー(netrw)を無効化
    default_file_explorer = true,
    columns = {
      "icon",
      -- "permissions",
      -- "size",
      -- "mtime",
    },
    -- ファイル詳細を隠す（シンプルにする）
    view_options = {
      show_hidden = true,
    },
  },
  -- キーバインドの設定
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "Open parent directory with Oil" },
  },
  -- アイコン表示のための依存関係
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
