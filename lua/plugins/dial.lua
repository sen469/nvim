return {
  "monaqa/dial.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local dial = require("dial.map")
    local augend = require("dial.augend")

    require("dial.config").augends:register_group{
      default = {
        augend.integer.alias.decimal,   -- 数値
        augend.date.alias["%Y/%m/%d"],  -- 日付
        augend.constant.alias.bool,     -- true <-> false
        augend.constant.new{            -- yes <-> no
          elements = {"yes", "no"},
          word = true,
          cyclic = true,
        },
      },
    }

    -- キーマップ設定
    vim.keymap.set("n", "<C-a>", dial.inc_normal(), {noremap = true})
    vim.keymap.set("n", "<C-x>", dial.dec_normal(), {noremap = true})
    vim.keymap.set("v", "<C-a>", dial.inc_visual(), {noremap = true})
    vim.keymap.set("v", "<C-x>", dial.dec_visual(), {noremap = true})
    vim.keymap.set("v", "g<C-a>", dial.inc_gvisual(), {noremap = true})
    vim.keymap.set("v", "g<C-x>", dial.dec_gvisual(), {noremap = true})
  end,
}

