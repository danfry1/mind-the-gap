local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local bg = p.backgrounds
  local ac = p.accents

  return {
    CmpItemAbbr = { fg = fg.subtext },
    CmpItemAbbrDeprecated = { fg = fg.overlay, strikethrough = true },
    CmpItemAbbrMatch = { fg = ac.overground, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = ac.overground, bold = true },
    CmpItemMenu = { fg = fg.overlay },
    CmpItemKind = { fg = ac.elizabeth },

    -- Kind icons / labels
    CmpItemKindClass = { fg = ac.overground },
    CmpItemKindColor = { fg = ac.central },
    CmpItemKindConstant = { fg = ac.overground },
    CmpItemKindConstructor = { fg = ac.overground },
    CmpItemKindEnum = { fg = ac.overground },
    CmpItemKindEnumMember = { fg = ac.overground },
    CmpItemKindEvent = { fg = ac.hammersmith },
    CmpItemKindField = { fg = ac.victoria },
    CmpItemKindFile = { fg = fg.text },
    CmpItemKindFolder = { fg = ac.victoria },
    CmpItemKindFunction = { fg = fg.text },
    CmpItemKindInterface = { fg = ac.overground },
    CmpItemKindKeyword = { fg = ac.elizabeth },
    CmpItemKindMethod = { fg = fg.text },
    CmpItemKindModule = { fg = fg.text },
    CmpItemKindOperator = { fg = ac.hammersmith },
    CmpItemKindProperty = { fg = ac.victoria },
    CmpItemKindReference = { fg = ac.dlr },
    CmpItemKindSnippet = { fg = ac.circle },
    CmpItemKindStruct = { fg = ac.overground },
    CmpItemKindText = { fg = fg.subtext },
    CmpItemKindTypeParameter = { fg = ac.overground },
    CmpItemKindUnit = { fg = ac.overground },
    CmpItemKindValue = { fg = ac.overground },
    CmpItemKindVariable = { fg = fg.text },

    -- Ghost text
    CmpGhostText = { fg = fg.overlay },
  }
end

return M
