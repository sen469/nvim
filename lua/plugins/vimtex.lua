return {
  "lervag/vimtex",
  ft = { "tex", "bib" },
  init = function()
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "out",
      aux_dir = "out",
      out_dir = "out",
      continuous = 1,
      options = {
        "-pdf",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }

    vim.g.vimtex_view_method = "zathura"

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      callback = function()
        vim.cmd("VimtexCompile")
      end,
    })
  end,
}
