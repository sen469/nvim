-- nvim/lua/plugins/rainbow-delimiters.lua
return {
  "HiPhish/rainbow-delimiters.nvim",
  -- C, C++ だけで読み込むように設定
  ft = { "c", "cpp" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    local rb = require('rainbow-delimiters')

    vim.g.rainbow_delimiters = {
      strategy = {
        -- デフォルトでは何もしない（他のバッファでのエラー防止）
        [''] = function() return nil end,
        -- C, C++ のみ有効化
        c = rb.strategy['global'],
        cpp = rb.strategy['global'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        cpp = 'rainbow-delimiters',
      },
    }
  end,
}
