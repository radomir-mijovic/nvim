return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap

      local on_attach = function(client, bufnr)
        -- Keybindings
        keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
        keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Show references" })
        keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
        keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
        keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show hover" })
        keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show diagnostics" })
        keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Previous diagnostic" })
        keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next diagnostic" })
      end

      -- Enhanced capabilities
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Use new vim.lsp.config API if available (Neovim 0.11+)
      if vim.lsp.config then
        -- Python
        vim.lsp.config.pyright = {
          cmd = { "pyright-langserver", "--stdio" },
          filetypes = { "python" },
          root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json" },
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        }

        -- HTML
        vim.lsp.config.html = {
          cmd = { "vscode-html-language-server", "--stdio" },
          filetypes = { "html" },
        }

        -- CSS
        vim.lsp.config.cssls = {
          cmd = { "vscode-css-language-server", "--stdio" },
          filetypes = { "css", "scss", "less" },
        }

        -- Emmet
        vim.lsp.config.emmet_ls = {
          cmd = { "emmet-ls", "--stdio" },
          filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        }

        -- Enable LSP servers
        vim.lsp.enable({ "pyright", "html", "cssls", "emmet_ls" })
      else
        -- Fallback to old lspconfig API
        local lspconfig = require("lspconfig")

        lspconfig.pyright.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        })

        lspconfig.html.setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        lspconfig.cssls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })

        lspconfig.emmet_ls.setup({
          capabilities = capabilities,
          on_attach = on_attach,
          filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        })
      end

      -- Set up LspAttach autocmd for keybindings (works with both APIs)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client then
            on_attach(client, args.buf)
          end
        end,
      })
    end,
  },

  -- Mason - LSP server installer
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_lspconfig.setup({
        ensure_installed = {
          "pyright",
          "html",
          "cssls",
          "emmet_ls",
        },
        automatic_installation = true,
      })
    end,
  },
}
