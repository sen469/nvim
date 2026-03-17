-- lua/plugins.lua
return {
  'tpope/vim-sensible',  -- sensicalな設定を提供するプラグイン
  'junegunn/fzf.vim',    -- Fuzzy Finder


  require("plugins.autopairs"),
  require("plugins.lsp"),
  require("plugins.nvim-neo-tree"),
  require("plugins.one_monokai"),
  require("plugins.toggleterm"),
  require("plugins.gitsigns"),
  require("plugins.vim-fugitive"),
  require("plugins.lualine"),
  require("plugins.hlchunk"),
  require("plugins.treesitter"),
  require("plugins.mason"),
  require("plugins.dap"),
  require("plugins.42-header"),
  require("plugins.restore-cursor"),
  -- require("plugins.bufferline"),
  require("plugins.comment"),
  require("plugins.dial"),
  require("plugins.autotag"),
  require("plugins.rainbow-delimiters"),
  require("plugins.telescope"),
  require("plugins.fzf-native"),
  require("plugins.nvim-surround"),
  require("plugins.nvim-colorizer"),
  require("plugins.dashbord"),
  require("plugins.nvim-treesitter-context"),
  require("plugins.screenkey"),
  require("plugins.smear-cursor"),
}
