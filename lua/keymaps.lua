-- lua/keymaps.lua
-- =========================================================
-- 共通オプション
local opts = { noremap = true, silent = true }

-- =========================================================
-- Telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers,    opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  opts)

-- =========================================================
-- Window / Split 操作
vim.keymap.set("n", "ss", ":split<CR><C-w>w",  opts)
vim.keymap.set("n", "sv", ":vsplit<CR><C-w>w", opts)

vim.keymap.set("n", "sh", "<C-w>h", opts)
vim.keymap.set("n", "sj", "<C-w>j", opts)
vim.keymap.set("n", "sk", "<C-w>k", opts)
vim.keymap.set("n", "sl", "<C-w>l", opts)

-- =========================================================
-- Insert mode
vim.keymap.set("i", "jk", "<Esc>", opts)

-- =========================================================
-- 設定ファイル
vim.keymap.set("n", "<F1>", ":edit $MYVIMRC<CR>", opts)

-- =========================================================
-- File Tree (Neo-tree)
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- =========================================================
-- 編集系ユーティリティ
vim.keymap.set("n", "cpal", ":%y<CR>", opts)
vim.keymap.set("n", "clr",  ":%d<CR>", opts)

-- =========================================================
-- Bufferline
vim.keymap.set("n", "<Tab>",   "<cmd>BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)

vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>",               opts)
vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>",   opts)
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", opts)
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>",   opts)
vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>",  opts)

for i = 1, 5 do
  vim.keymap.set(
    "n",
    "<leader>" .. i,
    "<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
    opts
  )
end

-- =========================================================
-- Debug (DAP) : 常設キーのみ
-- （hover / preview / ESC 管理は dap.lua 側）
-- =========================================================
local dap   = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<F5>",  dap.continue,  { desc = "DAP Continue" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
vim.keymap.set("n", "<F12>", dap.step_out,  { desc = "DAP Step Out" })

vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {
  desc = "Toggle Breakpoint",
})

vim.keymap.set("n", "<Leader>B", function()
  dap.set_breakpoint(vim.fn.input("Condition: "))
end, {
  desc = "Conditional Breakpoint",
})

vim.keymap.set("n", "<Leader>dr", function()
  dap.repl.open()
end, {
  desc = "DAP REPL",
})

vim.keymap.set("n", "<Leader>du", dapui.toggle, {
  desc = "DAP UI Toggle",
})

-- =========================================================
-- Insert: 直前の単語を大文字化
-- =========================================================
vim.keymap.set("i", "<C-l>", function()
  local line = vim.fn.getline(".")
  local col  = vim.fn.getpos(".")[3]
  local head = line:sub(1, col - 1)
  local word = vim.fn.matchstr(head, [[\v<(\k(<)@!)*$]])
  return "<C-w>" .. word:upper()
end, { expr = true })
