local M = {}

function M.check()
  require("nvim_tools").report(function(level, message)
    vim.health[level](message)
  end)
end

return M
