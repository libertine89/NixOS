{ ... }:

''
-- Credits to original https://github.com/one-dark
-- This is modified version of it

local M = {}

M.base_30 = {
  white = "#abb2bf",
  darker_black = "#1b1f27",
  black = "#1e222a",  --  nvim bg
  black2 = "#252931",
  one_bg = "#282c34", -- real bg of onedark
  one_bg2 = "#353b45",
  one_bg3 = "#373b43",
  grey = "#42464e",
  grey_fg = "#565c64",
  grey_fg2 = "#6f737b",
  light_grey = "#6f737b",
  red = "#d84a3d",
  baby_pink = "#F07178",
  pink = "#ff75a0",
  line = "#e2e2e2", -- for lines like vertsplit
  green = "#50a14f",
  vibrant_green = "#7eca9c",
  nord_blue = "#428bab",
  blue = "#4078f2",
  yellow = "#c18401",
  sun = "#dea95f",
  purple = "#a28dcd",
  dark_purple = "#8e79b9",
  teal = "#519ABA",
  orange = "#FF6A00",
  cyan = "#0b8ec6",
  statusline_bg = "#22262e",
  lightbg = "#2d3139",
  pmenu_bg = "#61afef",
  folder_bg = "#61afef",
}

M.base_16 = {
  base00 = "#1e222a",
  base01 = "#353b45",
  base02 = "#3e4451",
  base03 = "#545862",
  base04 = "#565c64",
  base05 = "#abb2bf",
  base06 = "#b6bdca",
  base07 = "#c8ccd4",
  base08 = "#d84a3d",
  base09 = "#d75f00",
  base0A = "#c18401",
  base0B = "#50a14f",
  base0C = "#0070a8",
  base0D = "#4078f2",
  base0E = "#a626a4",
  base0F = "#986801",
}

M.type = "dark"

M = require("base46").override_theme(M, "onedark")

return M

''
