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

-- Open new vertical split on dashboard
  vim.api.nvim_create_user_command("nsp", function()
    vim.cmd("vsp | Nvdash")
  end, {})

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

-- Auto-Remove trailing spaces
  vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function()
          vim.cmd([[%s/\s\+$//e]])
      end,
  })

-- Remember Cursor Position
  vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
      callback = function()
          local mark = vim.api.nvim_buf_get_mark(0, '"')
          local line = mark[1]
          if line > 1 and line <= vim.api.nvim_buf_line_count(0) then
              vim.api.nvim_win_set_cursor(0, mark)
          end
      end,
  })
''

