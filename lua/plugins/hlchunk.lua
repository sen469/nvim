-- hlchunk.nvim プラグインの設定
return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        use_treesitter = true,  -- Treesitter を使用
        notify = false, -- 通知を無効化して「no parser for」メッセージを抑制
        exclude_filetypes = {
          aerial = true,
          dashboard = true,
          norg = true,
          toml = true,
          yaml = true,
          json = true,
        },
        support_filetypes = { 
            "lua", 
            "cpp",
            "h", 
			"c",
			"hpp",
        }, -- サポートするファイルタイプ
		chars = {
          horizontal_line = "━",
          vertical_line = "┃",
          left_top = "┏",
          left_bottom = "┗",
          right_arrow = ">",
        },
        style = {
          { fg = "#e2c6ff", bold = true },
        },
      },
    })
  end,
}

