local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
  -- `def` でPythonの関数定義
  s("def", {
    t({
      "def function_name():",
      "    \"\"\"Docstring\"\"\"",
      "    pass",
    }),
  }),
  s("print", { t("print("), i(1), t(")") }),

  s("ml", {
    t({
      "import numpy as np",
      "import matplotlib.pyplot as plt",
    }),
  }),

  -- --- 競プロ用ジェネレータ ---
  -- 基本形
  s("gen_base", fmt([[
import random

def generate():
    {}

if __name__ == "__main__":
    generate()
]], { i(0) })),

  -- 数値
  s("gen_int", fmt([[{} = random.randint({}, {})]], { i(1, "N"), i(2, "1"), i(3, "100") })),

  -- 配列
  s("gen_array", fmt([[
{} = [random.randint({}, {}) for _ in range({})]
print(*{})
]], { i(1, "A"), i(2, "1"), i(3, "100"), i(4, "N"), i(1) })),

  -- グリッド (壁あり)
  s("gen_grid", fmt([[
H = random.randint({}, {})
W = random.randint({}, {})
print(H, W)
chars = ["{}", "{}"]
weights = [{}, {}]

for r in range(H):
    row = []
    for c in range(W):
        if r == 0 or r == H - 1 or c == 0 or c == W - 1:
            row.append("#")
        else:
            res = random.choices(chars, weights=weights, k=1)[0]
            row.append(res)
    print("".join(row))
]], { 
    i(1, "3"), i(2, "10"), -- H range
    i(3, "3"), i(4, "10"), -- W range
    i(5, "."), i(6, "#"), -- chars
    i(7, "0.7"), i(8, "0.3") -- weights
  })),

  -- グラフ/木 (辺)
  s("gen_tree", fmt([[
N = random.randint({}, {})
print(N)
for v in range(2, N + 1):
    u = random.randint(1, v - 1)
    print(u, v)
]], { i(1, "2"), i(2, "10") })),

  -- 文字列 (指定文字)
  s("gen_str", fmt([[
chars = "{}"
{} = "".join(random.choices(chars, k={}))
print({})
]], { i(1, "abc"), i(2, "S"), i(3, "N"), i(2) })),

  -- 文字列 (アルファベット)
  s("gen_alpha", fmt([[
import string
{} = "".join(random.choices(string.ascii_lowercase, k={}))
print({})
]], { i(1, "S"), i(2, "N"), i(1) })),
})

