return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      -- すべてのファイルタイプに対して適用する
      filetypes = { "*" },
      -- NvChad版ではここに設定を記述する必要がある
      user_default_options = {
        -- 色名（Blue, Redなど）のハイライトを無効化
        names = false,
        -- #RGB 形式（例: #F00）を有効化
        RGB = true,
        -- #RRGGBB 形式（例: #FF0000）を有効化
        RRGGBB = true,
        -- #RRGGBBAA 形式を有効化
        RRGGBBAA = true,
        -- 0xAARRGGBB 形式を有効化
        AARRGGBB = true,
        -- CSS関数（rgb()など）を無効化
        rgb_fn = false,
        hsl_fn = false,
        -- CSS全般の設定を無効化
        css = false,
        css_fn = false,
        -- 背景色を変更するモード
        mode = "background",
        -- Tailwind CSSの色指定も除外したい場合はfalseにする
        tailwind = false,
        -- Sassの色指定も除外したい場合はfalseにする
        sass = { enable = false, parsers = { "css" } },
      },
    })
  end,
}
