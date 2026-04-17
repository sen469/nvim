return {
  "lervag/vimtex",
  lazy = false, -- vimtex recommends not lazy loading
  config = function()
    if vim.fn.has("mac") == 1 then
      -- Skim を使用するための設定
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_activate = 1 -- プレビュー時にSkimを前面に出す
      vim.g.vimtex_view_skim_sync = 1     -- SyncTeXを有効化
    end
    
    -- コンパイル設定 (latexmkを使用)
    vim.g.vimtex_compiler_method = "latexmk"
    
    -- 連続コンパイルと出力ディレクトリの設定
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "out", -- ここで 'out/' ディレクトリを指定
      options = {
        "-pdfdvi",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }
    
    -- 不要な警告を非表示にする設定
    vim.g.vimtex_quickfix_ignore_filters = {
      'Underfull \\hbox',
      'Overfull \\hbox',
      'LaTeX Warning: .\\+ float specifier changed to',
      'Package siunitx Warning: Detected the "physics" package:',
    }
  end,
}
