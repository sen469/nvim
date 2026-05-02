-- lua/keymaps.lua
-- =========================================================
-- 共通オプション
local function make_opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- =========================================================
-- Window / Split 操作
vim.keymap.set("n", "ss", ":split<CR><C-w>w",  make_opts("Split Horizontal"))
vim.keymap.set("n", "sv", ":vsplit<CR><C-w>w", make_opts("Split Vertical"))

vim.keymap.set("n", "sh", "<C-w>h", make_opts("Go to Left Window"))
vim.keymap.set("n", "sj", "<C-w>j", make_opts("Go to Lower Window"))
vim.keymap.set("n", "sk", "<C-w>k", make_opts("Go to Upper Window"))
vim.keymap.set("n", "sl", "<C-w>l", make_opts("Go to Right Window"))

-- =========================================================
-- Insert mode
vim.keymap.set("i", "jk", "<Esc>", make_opts("Exit Insert Mode"))

-- =========================================================
-- 設定ファイル
vim.keymap.set("n", "<F1>", ":edit $MYVIMRC<CR>", make_opts("Edit Config (init.lua)"))

-- =========================================================
-- :terminalのときにEscを押すとNormal modeに戻る
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], make_opts("Exit Terminal Mode"))

-- =========================================================
-- File Tree (Neo-tree)
vim.keymap.set("n", "<leader>e", function()
  local is_neotree_open = false
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
    if ft == "neo-tree" then
      is_neotree_open = true
      break
    end
  end

  if is_neotree_open then
    vim.cmd("Neotree close")
  else
    vim.cmd("Neotree filesystem reveal left")
  end
end, make_opts("Toggle Neo-tree"))

-- =========================================================
-- 編集系ユーティリティ
vim.keymap.set("n", "cpal", ":%y<CR>", make_opts("Copy All Text"))
vim.keymap.set("n", "clr",  ":%d<CR>", make_opts("Clear All Text"))

-- =========================================================
-- バッファ操作ロジック
-- =========================================================

local function get_listed_bufs()
  local bufs = {}
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_get_option_value('buflisted', { buf = buf }) then
      table.insert(bufs, buf)
    end
  end
  return bufs
end

-- 1. Tab移動
vim.keymap.set("n", "<Tab>",   ":bnext<CR>", make_opts("Next Buffer"))
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", make_opts("Previous Buffer"))

-- 2. 現在のバッファを閉じる (\bb / \bd)
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", make_opts("Delete Buffer"))
vim.keymap.set("n", "<leader>bb", ":bdelete<CR>", make_opts("Delete Buffer"))

-- 3. バッファを選んで閉じる (\bc)
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
      vim.api.nvim_buf_delete(bufs[idx], { force = true })
    end
  end)
end, make_opts("Choose Buffer to Delete"))

-- 4. 他のバッファをすべて閉じる (\bo)
vim.keymap.set("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(get_listed_bufs()) do
    if buf ~= current then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, make_opts("Close Other Buffers"))

-- 5. 左側のバッファを閉じる (\bl)
vim.keymap.set("n", "<leader>bl", function()
  local current = vim.api.nvim_get_current_buf()
  local bufs = get_listed_bufs()
  local current_idx = 0
  for i, buf in ipairs(bufs) do
    if buf == current then
      current_idx = i
      break
    end
  end
  if current_idx > 1 then
    for i = 1, current_idx - 1 do
      vim.api.nvim_buf_delete(bufs[i], { force = true })
    end
  end
end, make_opts("Close Buffers to the Left"))

-- 6. 右側のバッファを閉じる (\br)
vim.keymap.set("n", "<leader>br", function()
  local current = vim.api.nvim_get_current_buf()
  local bufs = get_listed_bufs()
  local current_idx = 0
  for i, buf in ipairs(bufs) do
    if buf == current then
      current_idx = i
      break
    end
  end
  if current_idx > 0 and current_idx < #bufs then
    for i = current_idx + 1, #bufs do
      vim.api.nvim_buf_delete(bufs[i], { force = true })
    end
  end
end, make_opts("Close Buffers to the Right"))

-- 7. 番号でジャンプ (\1 ～ \5)
for i = 1, 5 do
  vim.keymap.set("n", "<leader>" .. i, function()
    local bufs = get_listed_bufs()
    if bufs[i] then
      vim.api.nvim_set_current_buf(bufs[i])
    end
  end, make_opts("Jump to Buffer " .. i))
end

-- =========================================================
-- その他
-- =========================================================

-- Insert: 直前の単語を大文字化
vim.keymap.set("i", "<C-l>", function()
  local line = vim.fn.getline(".")
  local col  = vim.fn.getpos(".")[3]
  local head = line:sub(1, col - 1)
  local word = vim.fn.matchstr(head, [[\v<(\k(<)@!)*$]])
  return "<C-w>" .. word:upper()
end, { expr = true, desc = "Uppercase Previous Word" })

-- ウィンドウの最大化トグル
local maximized = false
vim.keymap.set('n', '<leader>w', function()
  if maximized then
    vim.cmd('wincmd =')
    maximized = false
  else
    vim.cmd('wincmd _')
    vim.cmd('wincmd |')
    maximized = true
  end
end, make_opts("Toggle Maximize Window"))

-- Neo-tree 拡張
vim.keymap.set("n", "<leader>nf", ":Neotree filesystem reveal left<CR>", make_opts("Neo-tree Files"))
vim.keymap.set("n", "<leader>nb", ":Neotree buffers reveal left<CR>", make_opts("Neo-tree Buffers"))
vim.keymap.set("n", "<leader>ng", ":Neotree git_status reveal left<CR>", make_opts("Neo-tree Git"))
