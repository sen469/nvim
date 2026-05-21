local luasnip = require("luasnip")

-- 各言語のスニペットをロード
require("snippets.cpp")
require("snippets.c")
require("snippets.python")
require("snippets.tex")
require("snippets.sh")

-- スニペットを更新するコマンド
vim.api.nvim_create_user_command("LuaSnipReload", function()
  luasnip.cleanup()
  package.loaded["snippets.cpp"] = nil
  package.loaded["snippets.c"] = nil
  package.loaded["snippets.python"] = nil
  package.loaded["snippets.tex"] = nil
  package.loaded["snippets.sh"] = nil

  require("snippets.cpp")
  require("snippets.c")
  require("snippets.python")
  require("snippets.tex")
  require("snippets.sh")
  print("LuaSnip snippets reloaded!")
end, {})

