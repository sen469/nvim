local luasnip = require("luasnip")

-- 各言語のスニペットをロード
require("snippets.cpp")
require("snippets.c")
require("snippets.python")
require("snippets.rust")
require("snippets.tex")

-- スニペットを更新するコマンド
vim.api.nvim_create_user_command("LuaSnipReload", function()
  luasnip.cleanup()
  package.loaded["snippets.cpp"] = nil
  package.loaded["snippets.c"] = nil
  package.loaded["snippets.python"] = nil
  package.loaded["snippets.rust"] = nil
  package.loaded["snippets.tex"] = nil

  require("snippets.cpp")
  require("snippets.c")
  require("snippets.python")
  require("snippets.rust")
  require("snippets.tex")
  print("LuaSnip snippets reloaded!")
end, {})

