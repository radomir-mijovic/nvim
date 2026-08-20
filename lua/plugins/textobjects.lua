return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
      move = { set_jumps = true },
    })

    local move = require("nvim-treesitter-textobjects.move")
    local sel = require("nvim-treesitter-textobjects.select")
    local map = vim.keymap.set

    -- Motions
    map({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end, { desc = "Previous class" })
    map({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end, { desc = "Next class" })
    map({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Previous function" })
    map({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next function" })

    -- Text objects: vaf, vif, vac, vic, vaa, via
    map({ "x", "o" }, "af", function() sel.select_textobject("@function.outer", "textobjects") end, { desc = "Around function" })
    map({ "x", "o" }, "if", function() sel.select_textobject("@function.inner", "textobjects") end, { desc = "Inner function" })
    map({ "x", "o" }, "ac", function() sel.select_textobject("@class.outer", "textobjects") end, { desc = "Around class" })
    map({ "x", "o" }, "ic", function() sel.select_textobject("@class.inner", "textobjects") end, { desc = "Inner class" })
    map({ "x", "o" }, "aa", function() sel.select_textobject("@parameter.outer", "textobjects") end, { desc = "Around argument" })
    map({ "x", "o" }, "ia", function() sel.select_textobject("@parameter.inner", "textobjects") end, { desc = "Inner argument" })
  end,
}
