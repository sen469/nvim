-- nvim/lua/plugins/dashbord.lua
return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard = require("dashboard")

    dashboard.setup({
      theme = "doom",
      config = {
        header = {
          -- ... (ヘッダー部分は変更なし) ...
          "",
          " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝         ",
          "",
        },

        center = {
          {
            icon = " ",
            desc = "New File",
            key = "n",
            action = "enew",
          },
          {
            icon = " ",
            desc = "Find File",
            key = "f",
            action = "Telescope find_files",
          },
          {
            icon = "󰈞 ",
            desc = "Live Grep",
            key = "g",
            action = "Telescope live_grep",
          },
          {
            icon = " ",
            desc = "Recent Files",
            key = "r",
            action = "Telescope oldfiles",
          },
          {
            icon = " ",
            desc = "Recent Projects",
            key = "p",
            action = "Telescope project",
          },
          {
            icon = " ",
            desc = "Edit Config",
            key = "c",
            action = "edit $MYVIMRC",
          },
          {
            icon = " ",
            desc = "Quit",
            key = "q",
            action = "qa",
          },
        },
        footer = function()
          local stats = require("lazy").stats()
          return {
            "",
            string.format(
              "⚡ Neovim loaded %d plugins in %.3f ms",
              stats.count,
              stats.startuptime
            ),
          }
        end,
      },
    })
  end,
}
