local M = {}

-- この設定で使う外部コマンドの一覧。外部ツールを追加したらここも更新する。
-- { コマンド（複数ならいずれか）, 用途・導入のヒント }
M.groups = {
  {
    name = "手動導入: 基本機能・プラグインのビルド",
    tools = {
      { { "git" }, "lazy.nvim の初回導入・更新、Git 関連プラグイン" },
      { { "zsh" }, "options.lua で固定しているシェル" },
      { { "rg" }, "ripgrep: Telescope の全文検索・todo-comments" },
      { { "make" }, "telescope-fzf-native のビルド" },
      { { "cc" }, "C コンパイラ: fzf-native の make は既定で cc を使用。Treesitter にも必要" },
      { { "curl", "wget" }, "Mason / Treesitter のダウンロード（いずれか）" },
      { { "tar" }, "Mason / Treesitter のアーカイブ展開" },
      { { "gzip" }, "Mason の圧縮ファイル展開" },
      { { "unzip" }, "Mason の ZIP 展開" },
      { { "node" }, "Node.js: npm 系 LSP・MarkdownPreview" },
      { { "npm" }, "Mason の npm 系 LSP 導入・MarkdownPreview のビルド" },
    },
  },
  {
    name = "手動導入: 該当機能を使う場合",
    tools = {
      { { "xsel" }, "クリップボード。現在は X11 用の xsel に固定（Wayland/macOS では options.lua の変更も必要）" },
      { { "lazygit" }, "LazyGit コマンド" },
      { { "fd", "fdfind" }, "任意: Telescope のファイル検索。rg でも代用可能" },
      { { "python3" }, "Python プログラム・スニペットの実行" },
      { { "rustc" }, "Rust のコンパイル（Rust ツールチェーン）" },
      { { "cargo" }, "Rust プロジェクトの解析・ビルド" },
      { { "cargo-clippy" }, "rust-analyzer の check.command = clippy。rustup component add clippy で導入" },
      { { "latexmk" }, "VimTeX の自動コンパイル" },
      { { "pdflatex" }, "VimTeX の -pdf 用 TeX エンジン（TeX Live 等。プロジェクト設定で変更可能）" },
      { { "zathura" }, "VimTeX の PDF 表示。PDF 用バックエンドも必要" },
      { { "utftex", "latex2text" }, "render-markdown の数式表示を有効にする場合（latex2text は pylatexenc）" },
    },
  },
  {
    name = "Mason 管理: OS 側での手動導入は通常不要",
    mason = true,
    tools = {
      { { "clangd" }, "C/C++ LSP" },
      { { "pyright-langserver" }, "Python LSP (pyright)" },
      { { "rust-analyzer" }, "Rust LSP (rust_analyzer)" },
      { { "typescript-language-server" }, "JavaScript/TypeScript LSP (ts_ls)" },
      { { "vscode-html-language-server" }, "HTML LSP (html)" },
      { { "vscode-css-language-server" }, "CSS LSP (cssls)" },
      { { "codelldb" }, "DAP。未導入なら :MasonInstall codelldb（DAP 設定は Mason のパスを使用）" },
    },
  },
}

function M.inspect(tool, mason)
  for _, command in ipairs(tool[1]) do
    local path = mason and (vim.fn.stdpath("data") .. "/mason/bin/" .. command) or command
    if vim.fn.executable(path) == 1 then
      return true, vim.fn.exepath(path)
    end
  end
  return false
end

function M.report(emit)
  emit("start", "この Neovim 設定の外部ツール")
  emit("info", "実行ファイルの存在のみ確認します。バージョン・動作・接続環境は未検証です。")
  for _, group in ipairs(M.groups) do
    emit("start", group.name)
    for _, tool in ipairs(group.tools) do
      local found, path = M.inspect(tool, group.mason)
      local label = table.concat(tool[1], " / ") .. " — " .. tool[2]
      emit(found and "ok" or "warn", label .. (found and (" [" .. path .. "]") or " [未導入]"))
    end
  end
  emit("start", "手動確認")
  emit("info", "アイコン表示には端末側で Nerd Font を選択してください。MarkdownPreview にはブラウザが必要です。")
  emit("info", "Mason の LSP はファイルを開くと導入されます。詳細は :Mason / :checkhealth mason で確認できます。")
  emit("info", "この一覧は設定に合わせて管理しています。外部依存を変更したら lua/nvim_tools/init.lua も更新してください。")
end

return M
