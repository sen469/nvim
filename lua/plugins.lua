-- lua/plugins.lua
return {
  -- import = "plugins" により、lua/plugins/*.lua を自動的に読み込む
  { import = "plugins" },

  {
    "tpope/vim-fugitive",
    cmd = "Git",
    config = function()
      -- 必要に応じて設定を追加
    end
  }
}
