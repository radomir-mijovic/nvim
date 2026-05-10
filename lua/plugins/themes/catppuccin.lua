local active = require("theme") == "catppuccin"

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = not active,
  priority = active and 1000 or nil,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      styles = {
        comments = { "italic" },
        keywords = { "italic" },
      },
      custom_highlights = function(c)
        return {
          ["@variable"] = { fg = c.peach },
          ["@attribute"] = { fg = c.mauve },
          ["@variable.member"] = { fg = c.teal },
          ["@type"] = { fg = c.sky, style = { "bold" } },
        }
      end,
    })
    if active then
      vim.cmd.colorscheme("catppuccin")
    end
  end,
}
