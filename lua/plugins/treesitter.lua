return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "lua", "vim", "javascript", "html", "cpp" },
            sync_install = false,
            highlight = {
                enable = true,
				disable = {
					'cpp',
					'c',
				},
                -- ここを false にすると、Vim のハイライト（=カラースキーム）が優先される
                -- additional_vim_regex_highlighting = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = false },
            fold = { enable = true },
        })

        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldenable = true
        vim.opt.foldlevel = 99
    end
}
