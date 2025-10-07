-- nvim/lua/plugins/one_monokai.lua
return {
  "cpea2506/one_monokai.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("one_monokai")

    -- 透明度を設定 (背景を none にする)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- 編集している行をうっすら強調
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a2a" }) -- 薄暗いグレー
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffff80", bold = true }) -- 行番号を強調

    -- 少し遅延させて確実に上書き
    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, "Comment", {
        fg = "#858557",
        italic = true,
        cterm = { italic = true },
      })
    end, 10)
  end,
}
