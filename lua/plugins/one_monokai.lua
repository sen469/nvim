-- nvim/lua/plugins/one_monokai.lua
return {
  "cpea2506/one_monokai.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("one_monokai")

    -- =========================================================================
    -- 1. 基本的な透過設定 (編集領域・ウィンドウ・フローティング)
    -- =========================================================================
    -- エディタ背景・サインカラム・折畳み
    vim.api.nvim_set_hl(0, "Normal",     { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC",   { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })

    -- 行番号 (非アクティブ)・区切り線
    vim.api.nvim_set_hl(0, "LineNr",       { bg = "none" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })

    -- フローティングウィンドウ
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })


    -- =========================================================================
    -- 2. カーソル行・現在行番号の強調 (重複によりこちらを採用)
    -- =========================================================================
    -- 編集している行をダークグレーで強調
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#4B5263" })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#4B5263" })

    -- 現在行の行番号を黄色で強調
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffff80", bold = true })


    -- =========================================================================
    -- 3. UI・メニュー周り (補完・Telescope)
    -- =========================================================================
    -- 補完メニュー（非透明・可読性重視）
    vim.api.nvim_set_hl(0, "Pmenu", {
      fg = "#ABB2BF",
      bg = "#21252B", -- 実色（One Dark 系で見やすい）
    })
    vim.api.nvim_set_hl(0, "PmenuSel", {
      fg = "#282C34",
      bg = "#61AFEF",
      bold = true,
    })
    vim.api.nvim_set_hl(0, "PmenuSbar",  { bg = "#2C313A" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#5C6370" })

    -- Telescope（全面透過）
    vim.api.nvim_set_hl(0, "TelescopeNormal",         { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeBorder",         { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal",   { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal",  { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal",  { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeSelection",      { bg = "#3E4452", bold = true })


    -- =========================================================================
    -- 4. シンタックスハイライト詳細設定 (遅延適用)
    -- =========================================================================
    -- 少し遅延させて確実に上書き適用する
    vim.defer_fn(function()
      
      -- VSCode カラーピッカーに基づく配色パレット
      local colors = {
        orange_red = "#E06C75", -- using, #define, return, for, if など
        purple     = "#C678DD", -- 数字, 数式モード
        cyan       = "#56B6C2", -- int, main, struct, 通常コマンド
        blue       = "#61AFEF", -- vector, cin, cout, パッケージ引数
        white      = "#BBBBBB", -- ローカル変数, std, セミコロン
        orange     = "#E5C07B", -- 環境名
        green      = "#98C379", -- \begin, \end
      }

      -- コメント
      vim.api.nvim_set_hl(0, "Comment", {
        fg = "#858557",
        italic = true,
        cterm = { italic = true },
      })

      -- -----------------------------------------------------------------------
      -- [C++] キーワード・型・変数の色設定
      -- -----------------------------------------------------------------------
      -- 1. キーワード, 制御構文, プリプロセッサ (Orange Red)
      vim.api.nvim_set_hl(0, "@keyword",           { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@keyword.return",    { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@preproc",           { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@include",           { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@define",            { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@repeat",            { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@conditional",       { fg = colors.orange_red, italic = false })
      vim.api.nvim_set_hl(0, "@keyword.typedef",   { fg = colors.orange_red, italic = false })

      -- 2. 数字 (Purple)
      vim.api.nvim_set_hl(0, "@number",            { fg = colors.purple, italic = false })

      -- 3. 組み込み型, 関数, 構造体 (Cyan)
      vim.api.nvim_set_hl(0, "@type.builtin",      { fg = colors.cyan, italic = false })
      vim.api.nvim_set_hl(0, "@function",          { fg = colors.cyan, italic = false })
      vim.api.nvim_set_hl(0, "@structure",         { fg = colors.cyan, italic = false })

      -- 4. ユーザー定義型, 組み込み変数 (Blue)
      vim.api.nvim_set_hl(0, "@type",              { fg = colors.blue, italic = false })
      vim.api.nvim_set_hl(0, "@variable.builtin",  { fg = colors.blue, italic = false })

      -- 5. 変数, 区切り文字, 名前空間 (White)
      vim.api.nvim_set_hl(0, "@variable",               { fg = colors.white, italic = false })
      vim.api.nvim_set_hl(0, "@punctuation.delimiter",  { fg = colors.white, italic = false })
      vim.api.nvim_set_hl(0, "@namespace",              { fg = colors.white, italic = false })


      -- -----------------------------------------------------------------------
      -- [LaTeX] TeX関連の色設定
      -- -----------------------------------------------------------------------
      -- 1. \begin や \end コマンド (Green)
      vim.api.nvim_set_hl(0, "texCmdEnv",      { fg = colors.green })

      -- 2. 環境名 ({document} など) (Orange)
      vim.api.nvim_set_hl(0, "texEnvArgName",  { fg = colors.orange })

      -- 3. セクション系 (\section, \chapter) (Orange Red)
      vim.api.nvim_set_hl(0, "texCmdPart",     { fg = colors.orange_red })
      vim.api.nvim_set_hl(0, "texCmdTitle",    { fg = colors.orange_red })

      -- 4. パッケージ系コマンド (\usepackage) (Orange Red)
      vim.api.nvim_set_hl(0, "texCmdPackage",  { fg = colors.orange_red })
      vim.api.nvim_set_hl(0, "texCmdClass",    { fg = colors.orange_red })

      -- 5. パッケージ引数・スタイル (Blue)
      vim.api.nvim_set_hl(0, "texPackage",     { fg = colors.blue })
      vim.api.nvim_set_hl(0, "texStyle",       { fg = colors.blue })
      vim.api.nvim_set_hl(0, "texFilesArg",    { fg = colors.blue })

      -- 6. その他の通常コマンド (Cyan)
      vim.api.nvim_set_hl(0, "texCmd",         { fg = colors.cyan })

      -- 7. 数式モード (Purple / Orange Red)
      vim.api.nvim_set_hl(0, "texMathZoneX",   { fg = colors.purple })
      vim.api.nvim_set_hl(0, "texMathMatcher", { fg = colors.orange_red })

    end, 5) -- 5ms 遅延終了
  end,
}
