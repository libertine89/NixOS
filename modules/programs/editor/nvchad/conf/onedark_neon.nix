{ ... }:

''

-- Credits to original https://github.com/one-dark
-- This is modified version of it

local M = {}

M.base_30 = {
  white = "#5a6ba1",
  darker_black = "#0a0b14",
  black = "#0F111A", --  nvim bg
  black2 = "#191d2c",
  one_bg = "#23293e",
  one_bg2 = "#2d3550",
  one_bg3 = "#374162",
  grey = "#3c476b",
  grey_fg = "#46537d",
  grey_fg2 = "#505f8f",
  light_grey = "#5a6ba1",
  red = "#d84a3d",
  baby_pink = "#F07178",
  pink = "#ff75a0",
  line = "#191d2c", -- for lines like vertsplit
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
  base00 = "#0f111a",
  base01 = "#23293e",
  base02 = "#2d3550",
  base03 = "#374162",
  base04 = "#3c476b",
  base05 = "#eeffff",
  base06 = "#a5a9b5",
  base07 = "#b5b8c1",
  base08 = "#d84a3d",
  base09 = "#d75f00",
  base0A = "#c18401",
  base0B = "#50a14f",
  base0C = "#0070a8",
  base0D = "#4078f2",
  base0E = "#a626a4",
  base0F = "#986801",
}

M.polish_hl = {
  M.polish_hl = {
  tree = {
    NeoTreeIndentMarker = { fg = "#374162" }, -- your chosen colour
    NeoTreeDimText = { fg = "#374162" },      -- IMPORTANT (this is the real source)
  },

  treesitter = {
    ["@variable"] = { fg = M.base_30.white },
    ["@module"] = { fg = M.base_30.white },
    ["@variable.member"] = { fg = M.base_30.white },

    ["@type.builtin"] = { fg = M.base_30.purple },
    ["@variable.parameter"] = { fg = M.base_30.orange },
    ["@operator"] = { fg = M.base_30.cyan },
    ["@punctuation.delimiter"] = { fg = M.base_30.cyan },
    ["@punctuation.bracket"] = { fg = M.base_30.cyan },
    ["@punctuation.special"] = { fg = M.base_30.teal },
    ["@function.macro"] = { fg = M.base_30.pink },
    ["@keyword.storage"] = { fg = M.base_30.purple },
  },

  syntax = {
    StorageClass = { fg = M.base_30.purple },
    Repeat = { fg = M.base_30.purple },
    Define = { fg = M.base_30.blue },
  },

  telescope = {
    TelescopeSelection = { bg = M.base_30.one_bg, fg = M.base_30.blue },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "material-deep-ocean")

return M
''
