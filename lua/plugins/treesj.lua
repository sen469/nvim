return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  keys = { "<leader>m", "<leader>j", "<leader>s" },
  config = function()
    local treesj = require("treesj")
    treesj.setup({
      use_default_keymaps = false, -- デフォルトキーマップを無効化（自分で設定）
      check_syntax_error = true,
      max_join_length = 150,
    })

    -- 好みのキー設定
    vim.keymap.set("n", "<leader>m", treesj.toggle, { desc = "Split/Join" })
    vim.keymap.set("n", "<leader>j", treesj.join, { desc = "Join (1行に)" })
    vim.keymap.set("n", "<leader>s", treesj.split, { desc = "Split (複数行に)" })
  end,
}
