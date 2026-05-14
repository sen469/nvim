return {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('vscode').setup({
      -- 透過設定などが必要な場合はここで設定
      transparent = true,
      italic_comments = true,
    })
    -- vim.cmd.colorscheme("vscode") -- 切り替える場合はこちらを有効にする
  end
}
