return {
  "nvim-treesitter/nvim-treesitter-context",
  enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    max_lines = 3,
  },
}
