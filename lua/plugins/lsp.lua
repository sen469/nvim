return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      local luasnip = require("luasnip")
      -- スニペットのロードを遅延
      require("snippets.cpp")
      require("snippets.c")
      require("snippets.python")
      require("snippets.rust")

      -- スニペットを更新するコマンド
      vim.api.nvim_create_user_command("LuaSnipReload", function()
        luasnip.cleanup()
        package.loaded["snippets.cpp"] = nil
        package.loaded["snippets.c"] = nil
        package.loaded["snippets.python"] = nil
        package.loaded["snippets.rust"] = nil

        require("snippets.cpp")
        require("snippets.c")
        require("snippets.python")
        require("snippets.rust")
        print("LuaSnip snippets reloaded!")
      end, {})
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp', priority = 5 },
          { name = 'luasnip', priority = 10 },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
  },
}
