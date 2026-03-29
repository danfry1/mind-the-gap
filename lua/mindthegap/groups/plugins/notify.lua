local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local bg = p.backgrounds
  local ac = p.accents

  return {
    NotifyERRORBorder = { fg = ac.central },
    NotifyWARNBorder = { fg = ac.circle },
    NotifyINFOBorder = { fg = ac.victoria },
    NotifyDEBUGBorder = { fg = fg.overlay },
    NotifyTRACEBorder = { fg = ac.elizabeth },

    NotifyERRORIcon = { fg = ac.central },
    NotifyWARNIcon = { fg = ac.circle },
    NotifyINFOIcon = { fg = ac.victoria },
    NotifyDEBUGIcon = { fg = fg.overlay },
    NotifyTRACEIcon = { fg = ac.elizabeth },

    NotifyERRORTitle = { fg = ac.central, bold = true },
    NotifyWARNTitle = { fg = ac.circle, bold = true },
    NotifyINFOTitle = { fg = ac.victoria, bold = true },
    NotifyDEBUGTitle = { fg = fg.overlay, bold = true },
    NotifyTRACETitle = { fg = ac.elizabeth, bold = true },

    NotifyERRORBody = { fg = fg.text, bg = bg.surface0 },
    NotifyWARNBody = { fg = fg.text, bg = bg.surface0 },
    NotifyINFOBody = { fg = fg.text, bg = bg.surface0 },
    NotifyDEBUGBody = { fg = fg.text, bg = bg.surface0 },
    NotifyTRACEBody = { fg = fg.text, bg = bg.surface0 },

    NotifyBackground = { bg = bg.surface0 },
  }
end

return M
