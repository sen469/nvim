-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })

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

-- 次/前のバッファ
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })

-- バッファを閉じる
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { silent = true })
vim.keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { silent = true })   -- 選んで閉じる
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { silent = true }) -- 他を全部閉じる
vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", { silent = true })   -- 左を閉じる
vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", { silent = true })  -- 右を閉じる

-- バッファ番号指定移動
vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { silent = true })
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { silent = true })
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { silent = true })
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", { silent = true })
vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", { silent = true })

-- ^M を削除
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
