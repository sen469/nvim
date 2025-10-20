-- nvim/lua/plugins/one_monokai.lua
return {
  "cpea2506/one_monokai.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("one_monokai")

    -- 透明度を設定 (背景を none にする)
    vim.api.nvim_set_hl(0, "Normal", { bg = "#282C34" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- 編集している行をうっすら強調
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#383E4A" }) -- ダーク
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffff80", bold = true }) -- 行番号を強調

    vim.defer_fn(function()
      -- 既存のコメント設定
      vim.api.nvim_set_hl(0, "Comment", {
        fg = "#858557",
        italic = true,
        cterm = { italic = true },
      })

      -- ▼▼▼ VSCode カラーピッカーに基づく配色 ▼▼▼
      local colors = {
        orange_red = "#E06C75", -- using, #define, #include, return , for, if, while, typedef 用
        purple     = "#C678DD", -- 数字用
        cyan       = "#56B6C2", -- int (組み込み型), main (関数), struct 用
        blue       = "#61AFEF", -- vector, ll, vi (型), cin, cout (組み込み変数) 用
        white      = "#BBBBBB", -- n, m (ローカル変数), std (名前空間), セミコロン用
      }
      
      -- 1. キーワード, 制御構文, プリプロセッサ を オレンジ赤 (orange_red) に
      vim.api.nvim_set_hl(0, "@keyword", { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@keyword.return", { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@preproc", { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@include", { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@define", { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@repeat", { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@conditional", { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@keyword.typedef", { fg = colors.orange_red, italic = false }) -- ★ typedef を追加

      -- 2. 数字 を 紫 (purple) に
      vim.api.nvim_set_hl(0, "@number", { fg = colors.purple, italic = false })

      -- 3. 組み込み型, 関数 を 水色 (cyan) に
      vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.cyan, italic = false }) -- int, bool, char
      vim.api.nvim_set_hl(0, "@function", { fg = colors.cyan, italic = false })     -- main
      vim.api.nvim_set_hl(0, "@structure", { fg = colors.cyan, italic = false })    -- ★ struct 用

      -- 4. 型 (vector, ll), 組み込み変数 (cin, cout) を 青 (blue) に
      vim.api.nvim_set_hl(0, "@type", { fg = colors.blue, italic = false }) -- vector, string, vi, ll
      vim.api.nvim_set_hl(0, "@variable.builtin", { fg = colors.blue, italic = false }) -- cin, cout

      -- 5. ローカル変数 (n, m), 名前空間 (std), セミコロン を 白 (white) に
      vim.api.nvim_set_hl(0, "@variable", { fg = colors.white, italic = false }) -- n, m
      vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = colors.white, italic = false }) -- ; ,
      vim.api.nvim_set_hl(0, "@namespace", { fg = colors.white, italic = false }) -- std, atcoder
    end, 5) -- 5ms 遅延
  end,
}
