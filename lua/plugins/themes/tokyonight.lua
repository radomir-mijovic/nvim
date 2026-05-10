local active = require("theme") == "tokyonight"

return {
  "folke/tokyonight.nvim",
  lazy = not active,
  priority = active and 1000 or nil,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
      on_highlights = function(hl, c)
        hl["@variable"] = { fg = "#e0af68" }
        hl["@attribute"] = { fg = "#bb9af7" }
        hl["@variable.member"] = { fg = "#73daca" }
        hl["@type"] = { fg = "#2ac3de", bold = true }
      end,
    })
    if active then
      vim.cmd.colorscheme("tokyonight")
    end
  end,
}
