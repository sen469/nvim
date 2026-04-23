
return {
	-- 自作(｀･ω･´)ﾄﾞﾔ
  "sen46/restore-cursor.nvim",
  event = "BufReadPre",
  config = function()
    require("restore_cursor").setup()
  end,
}
