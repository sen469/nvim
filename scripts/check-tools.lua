-- 通常の init.lua やプラグインをロードせずに実行する。
local source = debug.getinfo(1, "S").source:sub(2)
local root = vim.fn.fnamemodify(source, ":p:h:h")
vim.opt.rtp:prepend(root)
require("nvim_tools").report(function(level, message)
  io.write(level == "start" and ("\n" .. message .. "\n") or ("[" .. level .. "] " .. message .. "\n"))
end)
