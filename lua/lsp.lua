-- lua/lsp.lua

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {"clangd", "pyright", "rust_analyzer", "matlab_ls", "ts_ls" },
})

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,

  ["clangd"] = function()
    local util = require("lspconfig.util")

    -- Neovimの設定ディレクトリ内 (~/.config/nvim/clangd) に設定を置く
    local nvim_config_dir = vim.fn.stdpath("config")
    local clangd_conf_dir = nvim_config_dir .. "/clangd"
    
    if vim.fn.isdirectory(clangd_conf_dir) == 0 then
      vim.fn.mkdir(clangd_conf_dir, "p")
    end

    -- inclde <bits/stdc++.h>にエラーが発生した場合はこれのバージョンを見る
    local clangd_config_file = clangd_conf_dir .. "/compile_flags.txt"
    if vim.fn.filereadable(clangd_config_file) == 0 then
      local default_config = [[
        -Wall
        -Wextra
        --gcc-toolchain=/opt/homebrew/opt/gcc
        -I/opt/homebrew/opt/gcc/include/c++/15/aarch64-apple-darwin24
        -I./
        -stdlib=libstdc++
        -I/opt/homebrew/Cellar/gcc/15.1.0/include/c++/15
        -I/opt/homebrew/Cellar/gcc/15.1.0/include/c++/15/aarch64-apple-darwin24/
        -I/opt/homebrew/Cellar/gcc/15.1.0/lib/gcc/15/include
        -Wno-invalid-constexpr
        -Wno-deprecated-builtins
        -Wno-bool-conversion
        -I/Users/sen46/my/kyopuro/
      ]]
      local f = io.open(clangd_config_file, "w")
      if f then
        f:write(default_config)
        f:close()
      end
    end

    lspconfig.clangd.setup({
      on_attach = on_attach,
      capabilities = capabilities,

      cmd = (function()
        local root_dir = util.root_pattern("compile_commands.json", ".git")(vim.fn.getcwd())
        -- compile_commands.json がない場合のフォールバック先を Neovim 内の clangd フォルダにする
        local default_dir = clangd_conf_dir

        local compile_dir
        if root_dir and vim.fn.filereadable(root_dir .. "/compile_commands.json") == 1 then
          compile_dir = root_dir
        else
          compile_dir = default_dir
        end

        local clangd_path = vim.fn.stdpath("data") .. "/mason/bin/clangd"
        if vim.fn.executable(clangd_path) ~= 1 then
          clangd_path = "clangd"
        end

        return {
          clangd_path,
          "--compile-commands-dir=" .. compile_dir,
        }
      end)(),

      flags = {
        debounce_text_changes = 150,
      },
    })
  end,

  -- ▼▼▼ Rust ▼▼▼
  ["rust_analyzer"] = function()
    lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            runBuildScripts = true,
          },
          procMacro = { enable = true },
          check = { command = "clippy" },
          diagnostics = { disabled = { "unresolved-proc-macro" } },
          completion = { postfix = { enable = true } },
          hover = { actions = { references = true } },
          inlayHints = {
            enable = true,
            parameterHints = true,
            chainingHints = true,
            closingBraceHints = { enable = true, minLines = 2 },
          },
          lens = { enable = true },
        },
      },
    })
  end,

  -- ▼▼▼ MATLAB ▼▼▼
  ["matlab_ls"] = function()
    local matlab_path = "/Applications/MATLAB_R2025a.app"
    -- macOSの場合、/Applications/MATLAB_*.app を検索して最新（最初に見つかったもの）を使用
    if vim.fn.has("mac") == 1 and vim.fn.isdirectory(matlab_path) == 0 then
      local matlab_apps = vim.fn.glob("/Applications/MATLAB_*.app", 0, 1)
      if #matlab_apps > 0 then
        matlab_path = matlab_apps[1]
      end
    end

    lspconfig.matlab_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        MATLAB = {
          installPath = matlab_path
        }
      },
      single_file_support = true,
    })
  end,
})

-- ▼▼▼ 診断表示の設定 ▼▼▼
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- ▼▼▼ Hover ウィンドウの見た目 ▼▼▼
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "rounded",
    max_width = 80,
  }
)

-- ▼▼▼ ポップアップメニューの配色 ▼▼▼
vim.cmd('highlight link Pmenu Normal')
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Comment" })
