return
{
  "Diogo-ss/42-header.nvim",
  cmd = { "Stdheader" },
  keys = { "<F1>" },
  opts = {
    default_map = true,
    auto_update = true,
    -- user = os.getenv("USER") or "user",
    -- mail = (os.getenv("USER") or "user") .. "@student.42tokyo.jp",
	user = "ssawa",
	mail = "ssawa@student.42tokyo.jp",
  },
  config = function(_, opts)
    require("42header").setup(opts)
  end,
}
