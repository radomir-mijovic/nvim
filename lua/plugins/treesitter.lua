return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-autopairs",
  },
  config = function()
    -- Use HTML parser for htmldjango files
    vim.treesitter.language.register("html", "htmldjango")

    local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autopairs = {
        enable = true,
      },
      ensure_installed = {
        "python",
        "html",
        "toml",
        "css",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
