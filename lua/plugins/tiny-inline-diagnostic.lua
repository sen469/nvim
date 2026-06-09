return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup()
    vim.diagnostic.config({
      virtual_text = false,
      -- 自動でフローティングウィンドウを開かないように明示的に設定
      float = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end,
}
