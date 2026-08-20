return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        htmldjango = { "djlint" },
      },
      formatters = {
        isort = {
          prepend_args = { "--profile", "black" },
        },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>m", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({ async = true, lsp_fallback = true })
    end, { desc = "Format with prettier (async)" })
  end,
}
