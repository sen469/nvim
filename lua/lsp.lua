-- lua/lspconfig.lua

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()
mason_lspconfig.setup({
  ensure_installed = {"clangd", "pyright", "rust_analyzer", "ts_ls", "html", "cssls" },
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
  -- 他のLSPサーバー用のデフォルト設定
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,

  -- clangd のカスタム設定
-- .config/nvim/lua/lsp.lua

["clangd"] = function()
        lspconfig.clangd.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
            debounce_text_changes = 150,
          },
        })
      end,

  -- rust_analyzer のカスタム設定
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
})

-- ▼▼▼ 診断機能の設定（ハンドラテーブルの外に移動） ▼▼▼
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- LSP hover ウィンドウの外観を調整する
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "rounded",  -- ほかに "single", "double", "shadow" もあり
    max_width = 80,      -- 幅が広すぎて読みにくいのを防ぐ
  }
)

-- (オプション) ポップアップメニューの背景も同様に設定
vim.cmd('highlight link Pmenu Normal')
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })      -- 背景色を通常と揃える
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Comment" })     -- 枠線をコメント色に
