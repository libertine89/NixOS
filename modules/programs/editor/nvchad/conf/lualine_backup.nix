{ ... }:

''
local C = {
  -- =========================================================
  -- Background colours for Bars
  -- =========================================================
  bg0 = "#0A0373",
  bg1 = "#1C1690",
  bg2 = "#3A36B5",
  bg3 = "#2A2680",

  bg_base = "#555555",

  fg = "#E6E6FF",
  inactive = "#555555",
  text = "#FFFFFF",

  -- =========================================================
  -- MODE COLORS
  -- =========================================================
  nMode = "#4C6EF5",
  iMode = "#51CF66",
  vMode = "#845EF7",
  VMode = "#6D4CDB",
  CVMode = "#22B8CF",
  cMode = "#FAB005",
  RMode = "#FA5252",
  tMode = "#ADB5BD",
}

-- =========================================================
-- MODE SYSTEM
-- =========================================================

local ModeColor = {
  n = C.nMode,
  i = C.iMode,
  v = C.vMode,
  V = C.VMode,
  ["\22"] = C.CVMode,
  c = C.cMode,
  R = C.RMode,
  t = C.tMode,
}

local ModeName = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "VISUAL LINE",
  ["\22"] = "VISUAL BLOCK",
  c = "COMMAND",
  R = "REPLACE",
  t = "TERMINAL",
}

local function mode()
  return vim.fn.mode()
end

local function mode_color()
  return ModeColor[mode()] or C.bg0
end

local function mode_name()
  return ModeName[mode()] or mode()
end

-- =========================================================
-- HELPERS
-- =========================================================

local function block(component, bg, fg)
  return {
    component,
    color = { bg = bg, fg = fg },
    padding = { left = 1, right = 1 },
  }
end

local function block_fn(fn, bg, fg)
  return {
    function() return fn() end,
    color = { bg = bg, fg = fg },
    padding = { left = 1, right = 1 },
  }
end

local function sep_right(left_bg, right_bg)
  return {
    function() return "" end,
    color = { fg = right_bg, bg = left_bg },
    padding = 0,
  }
end

local function sep_left(left_bg, right_bg)
  return {
    function() return "" end,
    color = { fg = right_bg, bg = left_bg },
    padding = 0,
  }
end

-- =========================================================
-- MODE-AWARE FADE CAPS
-- =========================================================

local function mode_fade_in()
  return {
    function() return "░▒▓" end,
    color = function()
      return { fg = mode_color(), bg = C.bg_base }
    end,
    padding = 0,
  }
end

local function mode_fade_out()
  return {
    function() return "▓▒░" end,
    color = function()
      return { fg = mode_color(), bg = C.bg_base }
    end,
    padding = 0,
  }
end

local function mode_sep(next_bg)
  return {
    function() return "" end,
    color = function()
      return { fg = next_bg, bg = mode_color() }
    end,
    padding = 0,
  }
end

-- =========================================================
-- NEW MODE-AWARE RIGHT SIDE HELPERS
-- =========================================================

local function mode_block(component)
  return {
    component,
    color = function()
      return {
        bg = mode_color(),
        fg = C.fg,
      }
    end,
    padding = { left = 1, right = 1 },
  }
end

local function mode_sep_left(prev_bg)
  return {
    function() return "" end,
    color = function()
      return {
        fg = prev_bg,
        bg = mode_color(),
      }
    end,
    padding = 0,
  }
end

-- =========================================================
-- LUALINE SETUP
-- =========================================================

require("lualine").setup({
  options = {
    theme = {
      normal = {
        a = { bg = C.bg_base, fg = C.fg },
        b = { bg = C.bg_base, fg = C.fg },
        c = { bg = C.bg_base, fg = C.fg },
      },
      insert = {
        a = { bg = C.bg_base, fg = C.fg },
        b = { bg = C.bg_base, fg = C.fg },
        c = { bg = C.bg_base, fg = C.fg },
      },
      visual = {
        a = { bg = C.bg_base, fg = C.fg },
        b = { bg = C.bg_base, fg = C.fg },
        c = { bg = C.bg_base, fg = C.fg },
      },
      replace = {
        a = { bg = C.bg_base, fg = C.fg },
        b = { bg = C.bg_base, fg = C.fg },
        c = { bg = C.bg_base, fg = C.fg },
      },
      inactive = {
        a = { bg = C.bg_base, fg = C.inactive },
        b = { bg = C.bg_base, fg = C.inactive },
        c = { bg = C.bg_base, fg = C.inactive },
      },
    },

    icons_enabled = true,
    globalstatus = false,
    component_separators = "",
    section_separators = "",
  },

  sections = {

    -- =========================================================
    -- LEFT SIDE
    -- =========================================================
    lualine_a = {

      mode_fade_in(),

      {
        function()
          return mode_name()
        end,
        color = function()
          return { bg = mode_color(), fg = C.fg }
        end,
        padding = { left = 1, right = 1 },
      },

      mode_sep(C.fg),
      sep_right(C.fg, C.bg0),

      block_fn(function()
        return vim.fn.expand("%:t")
      end, C.bg0, C.text),

      sep_right(C.bg0, C.bg1),

      {
        "branch",
        color = { bg = C.bg1, fg = C.text },
        padding = { left = 1, right = 1 },
      },

      sep_right(C.bg1, C.bg2),

      {
        "diff",
        color = { bg = C.bg2, fg = C.text },
        padding = { left = 1, right = 1 },
      },

      {
        function() return "" end,
        color = { fg = C.bg2, bg = C.bg_base },
        padding = 0,
      },
    },

    lualine_b = {},
    lualine_c = {},

    -- =========================================================
    -- RIGHT SIDE
    -- =========================================================

    lualine_x = {
      {
        function() return "" end,
        color = { fg = C.bg2, bg = C.bg_base },
        padding = 0,
      },

      {
        "diagnostics",
        color = { bg = C.bg2, fg = C.text },
        padding = { left = 1, right = 1 },
      },

      -- sep_left(C.bg2, C.bg2),

      {
        "lsp",
        color = { bg = C.bg2, fg = C.text },
        padding = { left = 1, right = 1 },
      },

      sep_left(C.bg1, C.bg2),

      {
        "filetype",
        color = { bg = C.bg1, fg = C.text },
        padding = { left = 1, right = 1 },
      },

      sep_left(C.bg0, C.bg1),

      {
        function()
          return os.date("%H:%M")
        end,
        color = { bg = C.bg0, fg = C.fg },
        padding = { left = 1, right = 1 },
      },

      sep_left(C.fg, C.bg0),
      mode_sep_left(C.fg),

      {
        "location",
        color = function()
          return {
            bg = mode_color(),
            fg = C.fg,
          }
        end,
        padding = { left = 1, right = 1 },
      },

      mode_fade_out(),
    },

    lualine_y = {},
    lualine_z = {},
  },
})
''
