return {
  "NStefan002/screenkey.nvim",
  cmd = { "Screenkey", "ScreenkeyToggle" },

  opts = {
    win_opts = {
      relative = "editor",
      anchor = "NE",
      row = 1,
      col = vim.o.columns - 1,
      border = "rounded",
      style = "minimal",
      focusable = false,
    },

    keys = {
      ["<Space>"] = "␣",
      ["<S-Space>"] = "␣",
	  ["<lt>"] = "<",
	  ["<S-0>"] = "0",
    },
  },
}
