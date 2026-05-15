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

-- Fix Treesitter 'range' nil error on Neovim 0.12+
-- This is a temporary fix until nvim-treesitter is updated
if vim.version().minor >= 12 then
  local ok, query = pcall(require, "vim.treesitter.query")
  if ok then
    local original_add_directive = query.add_directive
    query.add_directive = function(name, handler, opts)
      local wrapped_handler = function(match, pattern, bufnr, pred, metadata)
        local new_match = {}
        for i, node in pairs(match) do
          if type(node) == "table" then
            new_match[i] = node[1]
          else
            new_match[i] = node
          end
        end
        return handler(new_match, pattern, bufnr, pred, metadata)
      end
      return original_add_directive(name, wrapped_handler, opts)
    end
  end
end

-- ==============================================================
-- プロジェクトごとの設定 (.nvim.lua) を読み込む
-- プロジェクトルート（.git または .nvim.lua がある場所）を検索して、確認後に実行する
local local_config = vim.fs.find('.nvim.lua', { upward = true, stop = vim.uv.os_homedir() })[1]
if local_config then
  local choice = vim.fn.confirm("ローカル設定ファイル (.nvim.lua) を読み込みますか？\n" .. local_config, "&Yes\n&No", 2)
  if choice == 1 then
    dofile(local_config)
  end
end
