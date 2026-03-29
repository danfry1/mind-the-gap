local M = {}

function M.get(p, config)
  local bg = p.backgrounds
  local fg = p.foregrounds
  local ac = p.accents
  local sp = p.special
  local util = require("mindthegap.util")

  local base_bg = config.transparent and "NONE" or bg.base
  local nc_bg = config.transparent and "NONE" or bg.mantle

  return {
    -- Core
    Normal = { fg = fg.text, bg = base_bg },
    NormalFloat = { fg = fg.text, bg = bg.surface0 },
    NormalNC = { fg = fg.text, bg = nc_bg },
    FloatBorder = { fg = bg.surface2, bg = bg.surface0 },
    FloatTitle = { fg = ac.elizabeth, bg = bg.surface0, bold = true },

    -- Cursor & line
    Cursor = { fg = bg.base, bg = sp.cursor },
    CursorIM = { fg = bg.base, bg = sp.cursor },
    CursorLine = { bg = bg.surface0 },
    CursorColumn = { bg = bg.surface0 },
    CursorLineNr = { fg = ac.elizabeth, bold = true },
    LineNr = { fg = fg.overlay },
    LineNrAbove = { fg = fg.overlay },
    LineNrBelow = { fg = fg.overlay },

    -- Columns & signs
    SignColumn = { fg = fg.overlay, bg = base_bg },
    FoldColumn = { fg = fg.overlay, bg = base_bg },
    ColorColumn = { bg = bg.surface0 },

    -- Selection & search
    Visual = { bg = sp.selection },
    VisualNOS = { bg = sp.selection },
    Search = { fg = bg.base, bg = ac.circle },
    IncSearch = { fg = bg.base, bg = ac.overground },
    CurSearch = { fg = bg.base, bg = ac.overground },
    Substitute = { fg = bg.base, bg = ac.hammersmith },

    -- Status & tab lines
    StatusLine = { fg = fg.subtext, bg = bg.mantle },
    StatusLineNC = { fg = fg.overlay, bg = bg.mantle },
    TabLine = { fg = fg.overlay, bg = bg.mantle },
    TabLineFill = { bg = bg.crust },
    TabLineSel = { fg = fg.text, bg = bg.base, bold = true },

    -- Window
    WinSeparator = { fg = bg.surface1 },
    WinBar = { fg = fg.text, bg = base_bg },
    WinBarNC = { fg = fg.overlay, bg = nc_bg },
    VertSplit = { fg = bg.surface1 },

    -- Popup menu
    Pmenu = { fg = fg.text, bg = bg.surface0 },
    PmenuBorder = { fg = bg.surface2, bg = bg.surface0 },
    PmenuSel = { fg = fg.text, bg = bg.surface1, bold = true },
    PmenuSbar = { bg = bg.surface1 },
    PmenuThumb = { bg = bg.surface2 },
    PmenuKind = { fg = ac.elizabeth, bg = bg.surface0 },
    PmenuKindSel = { fg = ac.elizabeth, bg = bg.surface1 },
    PmenuExtra = { fg = fg.subtext, bg = bg.surface0 },
    PmenuExtraSel = { fg = fg.subtext, bg = bg.surface1 },

    -- Diff (alpha blended onto base background)
    DiffAdd = { bg = util.blend(ac.district, bg.base, 0.15) },
    DiffChange = { bg = util.blend(ac.victoria, bg.base, 0.15) },
    DiffDelete = { bg = util.blend(ac.central, bg.base, 0.15) },
    DiffText = { bg = util.blend(ac.victoria, bg.base, 0.30) },

    -- Spell
    SpellBad = { undercurl = true, sp = ac.central },
    SpellCap = { undercurl = true, sp = ac.circle },
    SpellLocal = { undercurl = true, sp = ac.victoria },
    SpellRare = { undercurl = true, sp = ac.dlr },

    -- File system
    Directory = { fg = ac.victoria },

    -- Buffer UI
    EndOfBuffer = { fg = bg.base },
    NonText = { fg = bg.surface1 },
    SpecialKey = { fg = bg.surface2 },
    Whitespace = { fg = bg.surface1 },
    Conceal = { fg = fg.overlay },

    -- Matching
    MatchParen = { fg = ac.overground, bold = true },

    -- Title
    Title = { fg = ac.elizabeth, bold = true },

    -- Messages
    MsgArea = { fg = fg.text },
    ModeMsg = { fg = fg.text, bold = true },
    MoreMsg = { fg = ac.district, bold = true },
    Question = { fg = ac.elizabeth },
    WarningMsg = { fg = ac.circle },
    ErrorMsg = { fg = ac.central, bold = true },

    -- Folds
    Folded = { fg = fg.overlay, bg = bg.surface0 },

    -- Quickfix
    qfFileName = { fg = ac.victoria },
    qfLineNr = { fg = ac.elizabeth },
  }
end

return M
