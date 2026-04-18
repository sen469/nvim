-- lua/keymaps.lua
local opts = { noremap = true, silent = true }

-- Telescope (関数内で require)
vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, opts)
vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end,  opts)
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end,    opts)
vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end,  opts)

-- Window / Split
vim.keymap.set("n", "ss", ":split<CR><C-w>w",  opts)
vim.keymap.set("n", "sv", ":vsplit<CR><C-w>w", opts)
vim.keymap.set("n", "sh", "<C-w>h", opts)
vim.keymap.set("n", "sj", "<C-w>j", opts)
vim.keymap.set("n", "sk", "<C-w>k", opts)
vim.keymap.set("n", "sl", "<C-w>l", opts)

-- Insert mode
vim.keymap.set("i", "jk", "<Esc>", opts)
vim.keymap.set("i", "<C-l>", "<Esc>viwUea", opts) -- Convert previous word to uppercase
vim.keymap.set("n", "<F1>", ":edit $MYVIMRC<CR>", opts)
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set("n", "clr", ":%d<CR>", opts)
vim.keymap.set("n", "cpal", ":%y<CR>", opts)

-- Neo-tree (関数内で判定)
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", opts)
vim.keymap.set("n", "\\e", ":Neotree toggle<CR>", opts)

-- Buffer 操作
vim.keymap.set("n", "<Tab>",   ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)
vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)
vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opts)
vim.keymap.set("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opts)
vim.keymap.set("n", "<leader>br", ":BufferLineCloseRight<CR>", opts)
for i = 1, 5 do
  vim.keymap.set("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", opts)
end

-- Debug (DAP)
vim.keymap.set("n", "<F5>",  function() require("dap").continue() end,  opts)
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, opts)
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, opts)
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end,  opts)
vim.keymap.set("n", "<Leader>b",  function() require("dap").toggle_breakpoint() end, opts)
vim.keymap.set("n", "<Leader>B",  function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, opts)
vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end, opts)
vim.keymap.set("n", "<Leader>du", function() require("dapui").toggle() end, opts)

-- 最大化
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
end)
