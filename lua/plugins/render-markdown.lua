return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ft = { 'markdown', 'quarto' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    enabled = false, -- デフォルトでは無効にする
    file_types = { 'markdown', 'quarto' },
  },
}
