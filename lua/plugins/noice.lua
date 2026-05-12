return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      progress = {
        enabled = false, -- LSP進捗表示を無効化して通知欄をスッキリさせる
      },
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = false,       -- 中央表示を無効化して下に寄せる（小さく見せるため）
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,       -- add a border to hover docs and signature help
    },
    views = {
      cmdline_popup = {
        position = {
          row = "90%", -- 下部に配置
          col = "50%",
        },
        size = {
          width = 40, -- 幅を60から40に縮小
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = "75%", -- cmdlineの少し上に配置
          col = "50%",
        },
        size = {
          width = 40, -- 幅を60から40に縮小
          height = 8,  -- 高さを10から8に縮小
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
      -- メッセージ通知 (mini) をよりコンパクトに設定
      mini = {
        position = {
          row = -2,
          col = "100%",
        },
        size = {
          width = "auto",
          height = "auto",
          max_width = 30, -- 最大幅を40から30に縮小
        },
        border = {
          style = "rounded",
        },
        win_options = {
          winblend = 10,
        },
      },
    },
    -- 必要に応じて、通知をminiビューに強制する設定
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        background_colour = "#000000",
        render = "compact", -- 省スペースな表示
        top_down = false,    -- 下から上に表示
        max_width = 30,      -- 通知の最大幅を制限
      },
    },
  },
}
