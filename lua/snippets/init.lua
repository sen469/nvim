local M = {}

M.setup = function()
  local luasnip = require("luasnip")

  -- 各言語のスニペットをロード
  require("snippets.cpp")
  require("snippets.c")
  require("snippets.python")
  require("snippets.rust")
  require("snippets.sh")
end

-- スニペットを更新するコマンド
vim.api.nvim_create_user_command("LuaSnipReload", function()
  local luasnip = require("luasnip")
  luasnip.cleanup()
  package.loaded["snippets.cpp"] = nil
  package.loaded["snippets.c"] = nil
  package.loaded["snippets.python"] = nil
  package.loaded["snippets.rust"] = nil
  package.loaded["snippets.sh"] = nil

  require("snippets.cpp")
  require("snippets.c")
  require("snippets.python")
  require("snippets.rust")
  require("snippets.sh")
  print("LuaSnip snippets reloaded!")
end, {})

return M

