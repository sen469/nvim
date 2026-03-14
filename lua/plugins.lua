-- lua/plugins.lua
return {
  'tpope/vim-sensible',  -- sensicalな設定を提供するプラグイン

  require("plugins.autopairs"),
  require("plugins.lsp"),
  require("plugins.nvim-neo-tree"),
  require("plugins.toggleterm"),
  require("plugins.gitsigns"),
  require("plugins.lualine"),
  require("plugins.hlchunk"),
  require("plugins.treesitter"),
  require("plugins.mason"),
--  require("plugins.nvim-dap"),
--  require("plugins.dap-gdb"),
  require("plugins.dap"),
  require("plugins.42-header"),
  require("plugins.restore-cursor"),
  -- require("plugins.bufferline"),
  require("plugins.comment"),
  require("plugins.dial"),
  require("plugins.treesj"),
  require("plugins.nvim-ts-autotag"),
  require("plugins.rainbow-delimiters"),
  require("plugins.vimtex"),
  require("plugins.one_monokai"),
  require("plugins.telescope"),
  require("plugins.fzf-native"),
  require("plugins.nvim-surround"),
  require("plugins.nvim-colorizer"),
  require("plugins.dashbord"),
  require("plugins.nvim-treesitter-context"),
  require("plugins.screenkey"),
  require("plugins.smear-cursor"),

  -- git管理--------------------------------------------------------------
  -- vim-fugitive
  {
    "tpope/vim-fugitive",
    config = function()
      -- 必要に応じて設定を追加
    end
  }
}
