{ ... }:

''
require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
  
  -- Cycle Modes
    map({ "n", "i", "v" }, "<C-@>", function()
        local mode = vim.fn.mode()
        if mode == "n" then
            -- Normal → Insert
            vim.api.nvim_feedkeys("i", "n", true)
        elseif mode == "i" then
            -- Insert → Visual
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>v", true, false, true), "n", true)
        elseif mode == "v" then
            -- Visual → Normal
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "n", true)
        end
    end, { desc = "Cycle modes: Normal → Insert → Visual → Normal" })
    
  -- Close current buffer
    map({ "n", "i", "v" }, "<C-q>", function()
        if vim.fn.mode() ~= "n" then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "n", true)
        end
        vim.cmd("bp | bd #")
    end, { desc = "Close current buffer (Ctrl-Q)" })

  -- Normal mode line navigation
    map("n", "<C-b>", "0", { desc = "Go to start of line" })
    map("n", "<C-e>", "$", { desc = "Go to end of line" })

  -- Insert mode paste
    map("i", "<C-p>", "<C-r>+", { desc = "Paste from clipboard" })

''

