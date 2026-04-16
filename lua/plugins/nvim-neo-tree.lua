return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  -- cmd = "Neotree" は削除（自動起動に対応させるため）
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  -- 起動時にディレクトリを開いた場合に対応
  init = function()
    if vim.fn.argc() > 0 then
      local stats = vim.loop.fs_stat(vim.fn.argv(0))
      if stats and stats.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = { enable = true },
        hijack_netrw_behavior = "open_default", -- netrwを乗っ取る
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = { "node_modules" },
        },
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<CR>"] = "open",
          ["o"] = "open",
          ["s"] = "open_vsplit",
          ["i"] = "open_split",
          ["R"] = "refresh",
          ["q"] = "close_window",
          ["<Tab>"] = "preview",
        },
      },
      git_status = {
        symbols = {
          added     = "✚",
          modified  = "",
          deleted   = "✖",
          renamed   = "➜",
          untracked = "★",
          ignored   = "◌",
          unstaged  = "✗",
          staged    = "✓",
          conflict  = "",
        },
      },
    })
  end,
}
