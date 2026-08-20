return {
  "RRethy/vim-illuminate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("illuminate").configure({
      under_cursor = false,       -- don't highlight the word you're on
      delay = 250,
      providers = { "lsp", "treesitter", "regex" },
      min_count_to_highlight = 2, -- skip if it's the only occurrence
    })
  end,
}
