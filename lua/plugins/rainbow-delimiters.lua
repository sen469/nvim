-- nvim/lua/plugins/rainbow-delimiters.lua
return {
  "HiPhish/rainbow-delimiters.nvim",
  -- 全てのファイルで読み込むのではなく、特定の言語だけで読み込むように設定
  ft = { "lua", "cpp", "c", "python", "rust", "go", "javascript", "typescript", "java", "tex" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    local rb = require('rainbow-delimiters')

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rb.strategy['global'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-delimiters', -- 'rainbow-blocks' から変更
        cpp = 'rainbow-delimiters',
      },
      -- エラー対策: これら以外のバッファでは動作させない
      blacklist = { 'noice', 'nui', 'notify', 'cmp_menu', 'cmp_docs', 'neo-tree' },
    }
  end,
}
