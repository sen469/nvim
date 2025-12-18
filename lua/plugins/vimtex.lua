-- nvim/lua/plugins/vimtex.lua
return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- 1. ビルド設定 (latexmkを使用し、出力先を 'out' ディレクトリにする)
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "out",      -- VSCodeの "latex-workshop.latex.outDir": "out" に相当
      aux_dir = "out",        -- 補助ファイルも out に入れる
      out_dir = "out",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }

    -- 2. PDFビューアの設定 (UbuntuならZathuraがおすすめですが、一旦generalにしておきます)
    -- vim.g.vimtex_view_method = "zathura" 
    vim.g.vimtex_view_method = "general"

    -- 3. クリーンアップ対象の拡張子を追加
    -- VSCodeの "latex-workshop.latex.clean.fileTypes" に相当
    -- (VimTeXはデフォルトで主要なものを削除しますが、念のため追加設定)
    vim.g.vimtex_clean_additional_extensions = {
      "synctex.gz",
      "dvi",
      "out",
    }

    -- 4. コンパイル成功後に PDF をルートディレクトリにコピーする設定
    -- VSCodeの "latex-workshop.latex.postActions" (cpコマンド) に相当
    vim.api.nvim_create_autocmd("User", {
      pattern = "VimtexEventCompileSuccess",
      callback = function()
        -- 現在のバッファのファイル情報を取得
        local filename = vim.fn.expand("%:t:r") -- 拡張子なしのファイル名 (例: main)
        local out_dir = "out"
        
        -- コピー元のパス (例: out/main.pdf)
        local src = out_dir .. "/" .. filename .. ".pdf"
        -- コピー先のパス (例: ./main.pdf)
        local dst = filename .. ".pdf"

        -- Linuxの cp コマンドを実行
        -- ファイルが存在することを確認してからコピー
        if vim.fn.filereadable(src) == 1 then
           vim.fn.system({ "cp", src, dst })
           -- 完了メッセージ（うるさければコメントアウトしてください）
           print("Copied PDF to root: " .. dst)
        end
      end,
    })
  end
}
