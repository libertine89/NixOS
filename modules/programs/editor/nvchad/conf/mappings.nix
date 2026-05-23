{ ... }:

''
require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Unbind arrow keys
  local modes = { "n", "i", "v", "x" }
    for _, mode in ipairs(modes) do
        vim.keymap.set(mode, "<Up>", "<Nop>")
        vim.keymap.set(mode, "<Down>", "<Nop>")
        vim.keymap.set(mode, "<Left>", "<Nop>")
        vim.keymap.set(mode, "<Right>", "<Nop>")
    end

  -- Cycle Modes
    local function cycle_modes()
        local mode = vim.fn.mode()
        if mode == "n" then
            -- Normal → Insert
            vim.api.nvim_feedkeys("i", "n", false)
        elseif mode == "i" then
            -- Insert → Visual
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>v", true, false, true), "n", false)
        elseif mode == "v" then
            -- Visual → Normal
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
        end
    end

    vim.keymap.set({ "n", "i", "v" }, "<C-]>", cycle_modes, {
      desc = "Cycle modes: Normal → Insert → Visual → Normal", remap = false })

  -- Close current buffer
    map({ "n", "i", "v" }, "<C-q>", function()
      if vim.fn.mode() ~= "n" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "n", true)
        end
      vim.cmd("bp | bd #")
    end, { desc = "Close current buffer (Ctrl-Q)" })

  -- Unified line navigation keybindings for NVChad
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

  -- Normal mode
    map("n", "<C-b>", "0", opts)   -- Go to start of line
    map("n", "<C-e>", "$", opts)   -- Go to end of line

  -- Insert mode
    map("i", "<C-b>", "<ESC>I", opts)  -- Go to start of line and stay in insert mode
    map("i", "<C-e>", "<End>", opts)   -- Go to end of line in insert mode

  -- Visual modes: character-wise, line-wise, block-wise
  -- Using 'x' covers character-wise ('v') and select mode, and we add line/block separately
    map("v", "<C-b>", "0", opts)      -- character-wise visual
    map("v", "<C-e>", "$", opts)

    map("x", "<C-b>", "0", opts)      -- line-wise visual (Shift+v)
    map("x", "<C-e>", "$", opts)

    map("<C-v>", "<C-b>", "0", opts)  -- block-wise visual (Ctrl+v)
    map("<C-v>", "<C-e>", "$", opts)

  -- Insert mode paste
    map("i", "<C-p>", "<C-r>+", { desc = "Paste from clipboard" })

  -- Save in Insert mode
    vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { desc = "Save file in Insert mode" })
  ''

