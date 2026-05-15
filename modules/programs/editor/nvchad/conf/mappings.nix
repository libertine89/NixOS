{ ... }:

''
require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

  -- normal mode line navigation
    map("n", "<C-b>", "0", { desc = "Go to start of line" })
    map("n", "<C-e>", "$", { desc = "Go to end of line" })

  -- insert mode paste
    map("i", "<C-p>", "<C-r>+", { desc = "Paste from clipboard" })

''
