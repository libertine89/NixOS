{
  title = "NvChad/Neovim Keybinds";
  provider = "vim";
  binds = {
    Mode = [
      { key = "i"; desc = "Enter insert mode"; subcat = "Insert"; }
      { key = "v"; desc = "Enter visual mode"; subcat = "Visual"; }
      { key = "<Esc>"; desc = "Return to normal mode"; subcat = "Normal"; }
    ];

    Editing = [
      { key = "dd"; desc = "Delete current line"; subcat = "Delete"; }
      { key = "yy"; desc = "Yank current line"; subcat = "Yank"; }
      { key = "p"; desc = "Paste after cursor"; subcat = "Paste"; }
      { key = "u"; desc = "Undo last change"; subcat = "Undo/Redo"; }
      { key = "<C-r>"; desc = "Redo undone change"; subcat = "Undo/Redo"; }
    ];

    Navigation = [
      { key = "h"; desc = "Move cursor left"; }
      { key = "j"; desc = "Move cursor down"; }
      { key = "k"; desc = "Move cursor up"; }
      { key = "l"; desc = "Move cursor right"; }
      { key = "gg"; desc = "Go to first line"; }
      { key = "G"; desc = "Go to last line"; }
      { key = "0"; desc = "Go to beginning of line"; }
      { key = "$"; desc = "Go to end of line"; }
    ];

    Search = [
      { key = "/"; desc = "Search forward"; }
      { key = "?"; desc = "Search backward"; }
      { key = "n"; desc = "Repeat last search in same direction"; }
      { key = "N"; desc = "Repeat last search in opposite direction"; }
    ];

    "Windows & Tabs" = [
      { key = "<C-w>v"; desc = "Split window vertically"; }
      { key = "<C-w>s"; desc = "Split window horizontally"; }
      { key = "<C-w>h"; desc = "Move to left window"; }
      { key = "<C-w>j"; desc = "Move to bottom window"; }
      { key = "<C-w>k"; desc = "Move to top window"; }
      { key = "<C-w>l"; desc = "Move to right window"; }
      { key = ":tabnew"; desc = "Open new tab"; }
      { key = ":tabnext"; desc = "Next tab"; }
      { key = ":tabprev"; desc = "Previous tab"; }
    ];

    Leader = [
      { key = "<leader>ff"; desc = "Find files (Telescope)"; }
      { key = "<leader>fg"; desc = "Live grep (Telescope)"; }
      { key = "<leader>fb"; desc = "List buffers (Telescope)"; }
      { key = "<leader>fh"; desc = "Help tags (Telescope)"; }
      { key = "<leader>e"; desc = "Toggle file explorer (Nvim-Tree)"; }
      { key = "<leader>gs"; desc = "Git status (Gitsigns)"; }
      { key = "<leader>gc"; desc = "Git commit (Gitsigns)"; }
      { key = "<leader>gb"; desc = "Git blame (Gitsigns)"; }
      { key = "<leader>rn"; desc = "Rename symbol (LSP)"; }
      { key = "<leader>ca"; desc = "Code action (LSP)"; }
      { key = "<leader>gd"; desc = "Go to definition (LSP)"; }
      { key = "<leader>gr"; desc = "References (LSP)"; }
      { key = "<leader>dl"; desc = "Toggle diagnostics list"; }
      { key = "<leader>q"; desc = "Close current buffer"; }
    ];

    Command = [
      { key = ":w"; desc = "Save current file"; }
      { key = ":q"; desc = "Quit current window"; }
      { key = ":wq"; desc = "Save file and quit"; }
      { key = ":x"; desc = "Save file and quit (alternative)"; }
      { key = ":q!"; desc = "Quit without saving"; }
      { key = ":e <filename>"; desc = "Open file"; }
      { key = ":split <filename>"; desc = "Open file in horizontal split"; }
      { key = ":vsplit <filename>"; desc = "Open file in vertical split"; }
      { key = ":bnext"; desc = "Switch to next buffer"; }
      { key = ":bprev"; desc = "Switch to previous buffer"; }
      { key = ":bd"; desc = "Delete/close buffer"; }
      { key = ":ls"; desc = "List open buffers"; }
    ];
  };
}
