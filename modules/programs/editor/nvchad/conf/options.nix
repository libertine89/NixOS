{ ... }:

''
  require "nvchad.options"
  -- cursor 
    vim.opt.cursorline = true

  -- line behaviour
    -- vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.wrap = false
  
  -- scrolling
    vim.opt.scrolloff = 8
    vim.opt.sidescrolloff = 8
  
  -- indentation
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.opt.smartindent = true
    vim.opt.autoindent = true

  -- search
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.hlsearch = true
    vim.opt.incsearch = true

  -- system
    vim.opt.undofile = true
    vim.opt.clipboard = "unnamedplus"
''
