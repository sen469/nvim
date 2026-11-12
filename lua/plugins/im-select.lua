return {
  "keaising/im-select.nvim",
  main = "im_select",
  enabled = vim.fn.has("mac") == 1,
  event = { "InsertEnter", "CmdlineEnter", "TermEnter" },
  opts = {
    default_im_select = "com.apple.inputmethod.Kotoeri.RomajiTyping.Roman",
    default_command = "macism",
    set_default_events = { "InsertLeave", "CmdlineLeave", "TermLeave" },
  },
}
