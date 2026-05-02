return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  -- cmd = "Neotree", -- ディレクトリ指定での起動に対応するため、コマンドでの遅延読み込みを解除
  lazy = false, -- 起動時に読み込む
  keys = {
    { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    { "\\e", ":Neotree toggle<CR>", desc = "Toggle Neo-tree" },
    { "<leader>nf", desc = "Neo-tree Files" },
    { "<leader>nb", desc = "Neo-tree Buffers" },
    { "<leader>ng", desc = "Neo-tree Git" },
  },
  init = function()
    -- netrwを無効化してNeo-treeがディレクトリを扱えるようにする
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- アイコン表示
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true, -- Neo-treeが最後のウィンドウなら閉じる
      popup_border_style = "rounded", -- ポップアップの枠を丸くする
      enable_git_status = true,
      enable_diagnostics = true,

      -- 【見た目】上部のソース切り替えタブ（Filesystem, Buffers, Git）のデザイン
      source_selector = {
        winbar = true, -- ウィンドウバーに表示
        statusline = false,
        sources = {
          { source = "filesystem", display_name = " 󰉓 Files " },
          { source = "buffers", display_name = " 󰈚 Buffers " },
          { source = "git_status", display_name = " 󰊢 Git " },
        },
      },

      default_component_configs = {
        container = {
          enable_character_fade = true
        },
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true, -- 【見た目】インデントガイド（縦線）を表示
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          with_expanders = true, -- フォルダの展開アイコンを表示
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
          default = "*",
          highlight = "NeoTreeFileIcon"
        },
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true, -- 【見た目】Gitの状態に合わせてファイル名に色を付ける
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            added     = "", 
            modified  = "", 
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          }
        },
      },

      filesystem = {
        follow_current_file = { enable = true },
        hijack_netrw_behavior = "open_default", -- [No Name]回避用
        use_libuv_file_watcher = true, -- 【便利】OSのファイル変更を監視して自動更新
        
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = { "node_modules" },
        },

        window = {
          mappings = {
            -- 【便利】検索機能（/キーでディレクトリ内を検索）
            ["/"] = "fuzzy_finder",
            ["D"] = "fuzzy_finder_directory",
            ["#"] = "fuzzy_sorter", 
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter",
            ["<bs>"] = "navigate_up",
            ["."] = "set_root",
            ["[g"] = "prev_git_modified",
            ["]g"] = "next_git_modified",
            ["H"] = "toggle_hidden", -- 隠しファイルの表示切り替え
            
            -- 【便利】絶対パスをコピーする機能 (Yキー)
            ["Y"] = function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
              print("Copied: " .. path)
            end,
          },
          fuzzy_finder_mappings = { 
            ["<down>"] = "move_cursor_down",
            ["<C-n>"] = "move_cursor_down",
            ["<up>"] = "move_cursor_up",
            ["<C-p>"] = "move_cursor_up",
          },
        },
      },
      
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<CR>"] = "open",
          ["l"] = "open",       -- 【便利】lで開く（vimライク）
          ["h"] = "close_node", -- 【便利】hで閉じる（vimライク）
          ["P"] = { "toggle_preview", config = { use_float = true } }, -- 【便利】Pでプレビュー
          ["s"] = "open_vsplit",
          ["i"] = "open_split",
          ["t"] = "open_tabnew",
          ["w"] = "open_with_window_picker",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["a"] = { "add", config = { show_path = "none" } },
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["m"] = "move",
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
        }
      }
    })
  end,
}
