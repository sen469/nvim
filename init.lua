-- Leader キーの設定 (プラグインのロード前に必要)
vim.g.mapleader = "\\"

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

local function is_directory_startup()
  local dir = vim.fn.argv(0)
  return vim.fn.argc() == 1 and dir ~= "" and vim.fn.isdirectory(dir) == 1
end

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    if is_directory_startup() then
      vim.schedule(function()
        vim.cmd("Neotree filesystem reveal left dir=" .. vim.fn.fnameescape(vim.fn.argv(0)))
      end)
    end
  end,
})

-- ==============================================================
-- 基本オプションの設定
require('options')

-- キーマップの設定
require('keymaps')

-- Node.js のパスを設定
vim.g.coc_node_path = '/usr/bin/node'

-- YAMLファイルを開いた時だけ、タブをスペースに変換する設定を有効にする
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "yaml" },
  command = "setlocal expandtab",
})

-- カレントディレクトリの設定ファイルを読み込む許可(プロジェクトルートに.nvim.luaを置く)
vim.o.exrc = true
vim.o.secure = true

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
