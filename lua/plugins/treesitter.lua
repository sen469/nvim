-- nvim/lua/plugins/treesitter.lua
local ensure_installed = {
  "c",
  "lua",
  "vim",
  "javascript",
  "html",
  "cpp",
  "python",
  "markdown",
  "markdown_inline",
  "latex",
  "bibtex",
}

local tree_sitter_filetypes = {
  "c",
  "cpp",
  "lua",
  "vim",
  "javascript",
  "html",
  "python",
  "markdown",
  "tex",
  "bib",
}

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")

    treesitter.setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    local installed = {}
    for _, parser in ipairs(treesitter.get_installed("parser")) do
      installed[parser] = true
    end

    local missing = vim.tbl_filter(function(parser)
      return not installed[parser]
    end, ensure_installed)

    if #missing > 0 then
      treesitter.install(missing)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = tree_sitter_filetypes,
      callback = function()
        local ok = pcall(vim.treesitter.start)
        if not ok then
          return
        end

        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldenable = true
        vim.wo.foldlevel = 99
      end,
    })
  end,
}
