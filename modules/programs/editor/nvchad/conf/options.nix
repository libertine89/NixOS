{ lib, ... }:

lib.concatStringsSep "\n" [
    require "nvchad.options"
    
    -- line numbers
    vim.opt.relativenumber = true
    
    -- scrolling
    vim.opt.scrolloff = 8
    
    -- indentation
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
]
