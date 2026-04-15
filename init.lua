-- Lazy.nvim のパスを設定
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy.nvim をロード
require("lazy").setup({
  require("plugins")
})

-- ==============================================================
-- 基本オプションの設定
require('options')

-- キーマップの設定
require('keymaps')

-- Node.js のパスを設定
vim.g.coc_node_path = '/usr/bin/node'
--
-- YAMLファイルを開いた時だけ、タブをスペースに変換する設定を有効にする
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "yaml" },
  command = "setlocal expandtab",
})

-- 起動時チェック
if vim.fn.has("nvim") == 1 and vim.fn.glob("*.tex") ~= "" then
  vim.fn.serverstart("/tmp/nvim")
end

-- 後から開いた場合
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.tex",
  callback = function()
    if vim.v.servername == "" then
      vim.fn.serverstart("/tmp/nvim")
    end
  end,
})
