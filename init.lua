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
  { import = "plugins" }
}, {
  defaults = {
    lazy = false, -- デフォルトでは即時ロード。各プラグインで個別設定する
  },
  performance = {
    rtp = {
      -- 不要なランタイムプラグインを無効化して高速化
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- ==============================================================
-- 基本オプションの設定
require('options')

-- キーマップの設定
require('keymaps')
