return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Use HTML parser for htmldjango files
    vim.treesitter.language.register("html", "htmldjango")
    -- Use TSX parser for JSX files (the javascript parser doesn't understand JSX)
    vim.treesitter.language.register("tsx", "javascriptreact")

    require("nvim-treesitter").install({
      "python",
      "html",
      "toml",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "jsdoc",
      "json",
      "yaml",
      "markdown",
      "markdown_inline",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
    })

    -- Highlighting is started per-buffer via core Neovim (no-op if no parser)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
