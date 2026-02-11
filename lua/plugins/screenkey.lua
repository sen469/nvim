return {
  "NStefan002/screenkey.nvim",
  cmd = { "Screenkey", "ScreenkeyToggle" },

  opts = {
    win_opts = {
      relative = "editor",
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
