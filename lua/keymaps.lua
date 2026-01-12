-- Telescope
-- Telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers,    opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  opts)

-- 画面分割
vim.keymap.set("n", "ss", ":split<Return><C-w>w")
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- アクティブウィンドウの移動
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- jkでEsc
vim.keymap.set("i", "jk", "<Esc>")

-- 設定ファイルを開く
vim.keymap.set("n", "<F1>", ":edit $MYVIMRC<CR>")

-- ファイルツリー
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

-- 全選択コピー
vim.keymap.set("n", "cpal", ":%y<CR>") -- copy all

-- 全削除
vim.keymap.set("n", "clr", ":%d<CR>") -- clear

-- =========================================================
-- Bufferline代替設定 (Lualine用 / 標準機能 + Luaスクリプト)
-- =========================================================

-- 【補助関数】表示されているバッファのリストを取得 (ID順)
local function get_listed_bufs()
  local bufs = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_get_option_value('buflisted', { buf = buf }) then
      table.insert(bufs, buf)
    end
  end
  return bufs
end

-- 1. Tab移動 (次/前へ)
vim.keymap.set("n", "<Tab>",   ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", opts)

-- 2. 現在のバッファを閉じる (\bd)
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)

-- 3. バッファを選んで閉じる (\bc)
-- 簡易実装: リストを表示して番号入力を待つ
vim.keymap.set("n", "<leader>bc", function()
  local bufs = get_listed_bufs()
  print("Select buffer to delete:")
  for i, buf in ipairs(bufs) do
    local name = vim.api.nvim_buf_get_name(buf)
    name = name == "" and "[No Name]" or vim.fn.fnamemodify(name, ":t")
    print(string.format("%d: %s", i, name))
  end
  vim.ui.input({ prompt = "Index: " }, function(input)
    local idx = tonumber(input)
    if idx and bufs[idx] then
      vim.api.nvim_buf_delete(bufs[idx], {})
    end
  end)
end, opts)

-- 4. 他のバッファをすべて閉じる (\bo)
vim.keymap.set("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(get_listed_bufs()) do
    if buf ~= current then
      vim.api.nvim_buf_delete(buf, {})
    end
  end
end, opts)

-- 5. 左側のバッファを閉じる (\bl)
vim.keymap.set("n", "<leader>bl", function()
  local current = vim.api.nvim_get_current_buf()
  local bufs = get_listed_bufs()
  local current_idx = 0
  -- 現在位置を探す
  for i, buf in ipairs(bufs) do
    if buf == current then
      current_idx = i
      break
    end
  end
  -- 自分より前(左)を削除
  if current_idx > 1 then
    for i = 1, current_idx - 1 do
      vim.api.nvim_buf_delete(bufs[i], {})
    end
  end
end, opts)

-- 6. 右側のバッファを閉じる (\br)
vim.keymap.set("n", "<leader>br", function()
  local current = vim.api.nvim_get_current_buf()
  local bufs = get_listed_bufs()
  local current_idx = 0
  -- 現在位置を探す
  for i, buf in ipairs(bufs) do
    if buf == current then
      current_idx = i
      break
    end
  end
  -- 自分より後(右)を削除
  if current_idx > 0 and current_idx < #bufs then
    for i = current_idx + 1, #bufs do
      vim.api.nvim_buf_delete(bufs[i], {})
    end
  end
end, opts)

-- 7. 番号でジャンプ (\1 ～ \5)
-- lualineの表示順（バッファID順）の N 番目に移動します
for i = 1, 5 do
  vim.keymap.set("n", "<leader>" .. i, function()
    local bufs = get_listed_bufs()
    if bufs[i] then
      vim.api.nvim_set_current_buf(bufs[i])
    end
  end, opts)
end

-- ^M を削除
-- WSLのときのみ必要
vim.keymap.set("n", "<leader>m", ":%s/\\r//g<CR>")

-- Debug (DAP)
local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "デバッグ開始/継続" })
vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "ステップオーバー" })
vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "ステップイン" })
vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "ステップアウト" })
vim.keymap.set("n", "<Leader>b", function() dap.toggle_breakpoint() end, { desc = "ブレークポイント切替" })
vim.keymap.set("n", "<Leader>B", function() dap.set_breakpoint(vim.fn.input("Condition: ")) end, { desc = "条件付きブレークポイント" })
vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end, { desc = "デバッグREPL" })
vim.keymap.set("n", "<Leader>du", function() dapui.toggle() end, { desc = "DAP UI切替" })

-- 直前の文字列を大文字に変換してくれる
vim.keymap.set("i", "<C-l>",
    function()
        local line = vim.fn.getline(".")
        local col = vim.fn.getpos(".")[3]
        local substring = line:sub(1, col - 1)
        local result = vim.fn.matchstr(substring, [[\v<(\k(<)@!)*$]])
        return "<C-w>" .. result:upper()
    end,
    {expr = true}
)
