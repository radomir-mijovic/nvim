local active = require("theme") == "bamboo"

return {
  "ribru17/bamboo.nvim",
  name = "bamboo",
  lazy = not active,
  priority = active and 1000 or nil,
  config = function()
    require("bamboo").setup({
      style = "vulgaris", -- vulgaris, multiplex, light
      transparent = false,
      term_colors = true,
      code_style = {
        comments = { italic = true },
        keywords = { italic = true },
      },
      on_highlights = function(hl, c)
        hl["@variable"] = { fg = c.yellow }
        hl["@attribute"] = { fg = c.purple }
        hl["@variable.member"] = { fg = c.cyan }
        hl["@type"] = { fg = c.blue, bold = true }
      end,
    })
    if active then
      require("bamboo").load()
    end
  end,
}
