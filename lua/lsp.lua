local M = {}

M.setup = function()
  local mason = require("mason")
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")
  local cmp_lsp = require("cmp_nvim_lsp")

  -- 1. Mason本体のセットアップ
  mason.setup()

  -- 2. キーマップ設定（LSP接続時に有効にする共通関数）
  local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end

  -- 3. 補完機能（cmp）との連携設定
  local capabilities = cmp_lsp.default_capabilities()

  -- 4. mason-lspconfigの設定（サーバーリストとハンドラを一括定義）
  mason_lspconfig.setup({
    -- インストールするサーバーのリスト
    ensure_installed = {
      "clangd",
      "pyright",
      "rust_analyzer",
      "ts_ls",
      "html",
      "cssls" 
    },

    handlers = {
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,

      ["clangd"] = function()
        lspconfig.clangd.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = { "clangd", "--offset-encoding=utf-16" },
        })
      end,

      ["rust_analyzer"] = function()
        lspconfig.rust_analyzer.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            ["rust-analyzer"] = {
              check = { command = "clippy" },
            },
          },
        })
      end,
    },
  })

  -- エラー表示（診断）のデザイン設定
  vim.diagnostic.config({
    virtual_text = { prefix = "●" },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })

  -- ホバーウィンドウのデザイン
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = "rounded", max_width = 80 }
  )
end

return M
