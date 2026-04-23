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

    -- .latexmkrc を自動生成する設定
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      callback = function()
        -- プロジェクトルートを探す (.git か既存の .latexmkrc を目印にする)
        local root = vim.fs.find({ ".git", ".latexmkrc" }, { upward = true, path = vim.api.nvim_buf_get_name(0) })[1]
        if root then
          root = vim.fs.dirname(root)
        else
          root = vim.fn.expand("%:p:h")
        end

        local file_path = root .. "/.latexmkrc"
        if vim.fn.filereadable(file_path) == 0 then
          local content = [[#!/usr/bin/env perl

# LaTeX
$latex = 'platex -synctex=1 -halt-on-error -file-line-error %O %S';
$max_repeat = 15;

# BibTeX
$bibtex = 'pbibtex %O %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';

# index
$makeindex = 'mendex %O -o %D %S';

# DVI / PDF
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3;

# preview
$pvc_view_file_via_temporary = 0;
if ($^O eq 'linux') {
    $dvi_previewer = "xdg-open %S";
    $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
    $dvi_previewer = "open %S";
    $pdf_previewer = "open %S";
} else {
    $dvi_previewer = "start %S";
    $pdf_previewer = "start %S";
}

# clean up
$clean_full_ext = "%R.synctex.gz";
]]
          local f = io.open(file_path, "w")
          if f then
            f:write(content)
            f:close()
            vim.notify("Created .latexmkrc in " .. root, vim.log.levels.INFO)
          end
        end
      end,
    })
  end,
}
