return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    background_colour = "#000000",
    max_width = 40,      -- 幅を制限
    render = "compact", -- よりコンパクトな表示形式を使用
    stages = "fade",    -- フェードアニメーション
    timeout = 3000,     -- 表示時間を3秒に短縮
    top_down = false,   -- 下から上に積み上げる
  },
  config = function(_, opts)
    local stage_util = require("notify.stages.util")
    local direction = stage_util.DIRECTION.BOTTOM_UP
    local stages = require("notify.stages.fade")(direction)

    local function notification_row(state, win)
      local bottom, top = stage_util.get_slot_range(direction)
      local screenkey_win = vim.g.screenkey_winnr
      if screenkey_win and screenkey_win > 0 and vim.api.nvim_win_is_valid(screenkey_win) then
        local screenkey = vim.api.nvim_win_get_config(screenkey_win)
        local screenkey_top = screenkey.row
        if screenkey.anchor:sub(1, 1) == "S" then
          local border_height = screenkey.border and #screenkey.border > 0 and 2 or 0
          screenkey_top = screenkey_top - screenkey.height - border_height
        end
        -- screenkey の上枠より上に通知の下枠を収める。
        bottom = math.min(bottom, screenkey_top - 1)
      end

      -- 古い通知から下に並べ、オン・オフ時も全通知の位置を再計算する。
      for _, open_win in ipairs(state.open_windows) do
        if (not win or open_win < win) and vim.api.nvim_win_is_valid(open_win) then
          bottom = bottom - vim.api.nvim_win_get_height(open_win) - 2
        end
      end
      return bottom - state.message.height - 1, top
    end

    for index, stage in ipairs(stages) do
      stages[index] = function(state, win)
        local row, top = notification_row(state, win)
        if index == 1 and row < top then
          return nil -- 空きができるまで新しい通知を待機させる。
        end
        local result = stage(state, win)
        if result then
          -- 数値の目標値で即座に移動し、フェード中の重なりも避ける。
          result.row = math.max(row, top)
        end
        return result
      end
    end
    opts.stages = stages
    require("notify").setup(opts)
    vim.notify = require("notify")
  end,
}
