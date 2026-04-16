return {
  {
    "joshuadavidthomas/django-language-server",
    config = function()
      vim.lsp.config["djls"] = {
        cmd = { "djls", "serve" },
        filetypes = { "htmldjango", "python" },
        root_markers = { "manage.py", "pyproject.toml" },
      }
      vim.lsp.enable("djls")
    end,
  },
}
