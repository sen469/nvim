-- lua/plugins.lua
local plugins = {
  "plugins.42-header",
  "plugins.autopairs",
  "plugins.comment",
  "plugins.dap",
  "plugins.dashboard",
  "plugins.dial",
  "plugins.diffview",
  "plugins.gitsigns",
  "plugins.hlchunk",
  "plugins.lazygit",
  "plugins.lsp",
  "plugins.lualine",
  "plugins.markdown-preview",
  "plugins.mason",
  "plugins.mini-ai",
  "plugins.noice",
  "plugins.notify",
  "plugins.nvim-colorizer",
  "plugins.nvim-neo-tree",
  "plugins.nvim-surround",
  "plugins.nvim-treesitter-context",
  "plugins.nvim-ts-autotag",
  "plugins.oil",
  "plugins.one_monokai",
  "plugins.rainbow-delimiters",
  "plugins.render-markdown",
  "plugins.restore-cursor",
  "plugins.screenkey",
  "plugins.scrollbar",
  "plugins.smear-cursor",
  "plugins.telescope",
  "plugins.tiny-inline-diagnostic",
  "plugins.todo-comments",
  "plugins.toggleterm",
  "plugins.treesitter",
  "plugins.treesj",
  "plugins.vimtex",
  "plugins.which-key",
  "plugins.fugitive",
}

local spec = {}
for _, mod in ipairs(plugins) do
  table.insert(spec, { import = mod })
end

return spec
