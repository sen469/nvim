-- nvim/lua/plugins/dashboard.lua
return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local dashboard = require("dashboard")

    -- ASCII font (高さ 5)
    local font = {
      ["0"] = { " ███ ", "█   █", "█   █", "█   █", " ███ " },
      ["1"] = { "  █  ", " ██  ", "  █  ", "  █  ", " ███ " },
      ["2"] = { " ███ ", "    █", " ███ ", "█    ", "█████" },
      ["3"] = { "████ ", "    █", " ███ ", "    █", "████ " },
      ["4"] = { "█  █ ", "█  █ ", "█████", "   █ ", "   █ " },
      ["5"] = { "█████", "█    ", "████ ", "    █", "████ " },
      ["6"] = { " ███ ", "█    ", "████ ", "█   █", " ███ " },
      ["7"] = { "█████", "    █", "   █ ", "  █  ", "  █  " },
      ["8"] = { " ███ ", "█   █", " ███ ", "█   █", " ███ " },
      ["9"] = { " ███ ", "█   █", " ████", "    █", " ███ " },

      ["A"] = { " ███ ", "█   █", "█████", "█   █", "█   █" },
      ["D"] = { "████ ", "█   █", "█   █", "█   █", "████ " },
      ["E"] = { "█████", "█    ", "████ ", "█    ", "█████" },
      ["F"] = { "█████", "█    ", "████ ", "█    ", "█    " },
      ["H"] = { "█   █", "█   █", "█████", "█   █", "█   █" },
      ["I"] = { "█████", "  █  ", "  █  ", "  █  ", "█████" },
      ["M"] = { "█   █", "██ ██", "█ █ █", "█   █", "█   █" },
      ["N"] = { "█   █", "██  █", "█ █ █", "█  ██", "█   █" },
      ["O"] = { " ███ ", "█   █", "█   █", "█   █", " ███ " },
      ["R"] = { "████ ", "█   █", "████ ", "█  █ ", "█   █" },
      ["S"] = { " ████", "█    ", " ███ ", "    █", "████ " },
      ["T"] = { "█████", "  █  ", "  █  ", "  █  ", "  █  " },
      ["U"] = { "█   █", "█   █", "█   █", "█   █", " ███ " },
      ["W"] = { "█   █", "█   █", "█ █ █", "██ ██", "█   █" },

      [":"] = { "     ", "  █  ", "     ", "  █  ", "     " },
      ["-"] = { "     ", "     ", "█████", "     ", "     " },
      [" "] = { "     ", "     ", "     ", "     ", "     " },
    }

    local function ascii_render(str)
      local lines = { "", "", "", "", "" }
      for i = 1, #str do
        local c = str:sub(i, i)
        local glyph = font[c] or font[" "]
        for l = 1, 5 do
          lines[l] = lines[l] .. glyph[l] .. " "
        end
      end
      return lines
    end

    dashboard.setup({
      theme = "doom",
      config = {
        header = {
          "",
          " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "",
        },

        center = {
          { icon = " ", desc = "New File", key = "n", action = "enew" },
          { icon = " ", desc = "Find File", key = "f", action = "Telescope find_files" },
          { icon = "󰈞 ", desc = "Live Grep", key = "g", action = "Telescope live_grep" },
          { icon = " ", desc = "Recent Files", key = "r", action = "Telescope oldfiles" },
          { icon = " ", desc = "Recent Projects", key = "p", action = "Telescope project" },
          { icon = " ", desc = "Edit Config", key = "c", action = "edit $MYVIMRC" },
          { icon = " ", desc = "Quit", key = "q", action = "qa" },
        },

        footer = function()
          local stats = require("lazy").stats()

          local wday_map = {
            "SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"
          }

          local t = os.date("*t")
          local datetime = string.format(
            "%04d-%02d-%02d %s %02d:%02d",
            t.year,
            t.month,
            t.day,
            wday_map[t.wday],
            t.hour,
            t.min
          )

          local ascii_time = ascii_render(datetime)

          local result = { "" }
          for _, line in ipairs(ascii_time) do
            table.insert(result, line)
          end

          table.insert(result, "")
          table.insert(
            result,
            string.format(
              "⚡ Neovim loaded %d plugins in %.3f ms",
              stats.count,
              stats.startuptime
            )
          )

          return result
        end,
      },
    })
  end,
}
