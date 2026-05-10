local active = require("theme") == "kanagawa"

return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  lazy = not active,
  priority = active and 1000 or nil,
  config = function()
    require("kanagawa").setup({
      theme = "wave", -- wave, dragon, lotus
      transparent = false,
      terminalColors = true,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      overrides = function(colors)
        local p = colors.palette
        return {
          ["@variable"] = { fg = p.carpYellow },
          ["@attribute"] = { fg = p.oniViolet },
          ["@variable.member"] = { fg = p.waveAqua2 },
          ["@type"] = { fg = p.waveBlue2, bold = true },
        }
      end,
    })
    if active then
      vim.cmd.colorscheme("kanagawa")
    end
  end,
}
