return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  -- 設定は nvim/lua/lsp.lua で行うため、ここでは何もしない
  config = function()
  end,
}
