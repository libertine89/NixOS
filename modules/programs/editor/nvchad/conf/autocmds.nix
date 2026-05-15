{ ... }:

''
require "nvchad.autocmds"

-- Show dashboard on startup (nofile)
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      if vim.fn.argc() == 0 then
        vim.cmd("Nvdash")
      end
    end,
  })

-- Highlight text after yank
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank({
        timeout = 500,
        })
    end,
  })

-- Format on save (lsp)
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })
''
