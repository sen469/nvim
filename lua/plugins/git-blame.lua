return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = false, -- 最初から有効にする
    message_template = " <author> • <date> • <summary>",
    date_format = "%Y-%m-%d",
  },
}
