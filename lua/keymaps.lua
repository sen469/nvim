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
vim.keymap.set("n", "<F1>", ":edit $MYVIMRC<CR>", opts)
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

-- Neo-tree (関数内で判定)
vim.keymap.set("n", "<leader>e", function()
  local is_neotree_open = false
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_get_option_value("filetype", { buf = buf }) == "neo-tree" then
      is_neotree_open = true
      break
    end
  end
  if is_neotree_open then
    vim.cmd("Neotree close")
  else
    vim.cmd("Neotree filesystem reveal left")
  end
end, opts)

-- Buffer 操作
vim.keymap.set("n", "<Tab>",   ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)

-- Debug (DAP)
vim.keymap.set("n", "<F5>",  function() require("dap").continue() end,  opts)
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end, opts)
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end, opts)
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end,  opts)
vim.keymap.set("n", "<Leader>b",  function() require("dap").toggle_breakpoint() end, opts)
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
