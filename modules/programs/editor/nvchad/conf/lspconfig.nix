{ ... }:
''
  require("nvchad.configs.lspconfig").defaults()

  local servers = {
    "nixd",
    "html",
    "cssls",
    "lua_ls",
    "rust_analyzer",
    "pyright",
    "ts_ls",
    "bashls",
    "gopls",
  }

  vim.lsp.enable(servers)
''
