{ ... }:

''
  -- NvChad defaults
    require("nvchad.configs.lspconfig").defaults()

  -- Define servers via new API
    vim.lsp.config("pyright", {})
    vim.lsp.config("html", {})
    vim.lsp.config("cssls", {})
    vim.lsp.config("lua_ls", {})
    vim.lsp.config("rust_analyzer", {})
    vim.lsp.config("ts_ls", {})
    vim.lsp.config("bashls", {})
    vim.lsp.config("gopls", {})
    vim.lsp.config("nixd", {})

  -- Enable them
    vim.lsp.enable({
      "pyright",
      "html",
      "cssls",
      "lua_ls",
      "rust_analyzer",
      "ts_ls",
      "bashls",
      "gopls",
      "nixd",
    })
''
