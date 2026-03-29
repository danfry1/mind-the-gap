local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local bg = p.backgrounds
  local ac = p.accents
  local util = require("mindthegap.util")

  return {
    -- Sign column signs
    GitSignsAdd = { fg = ac.district },
    GitSignsChange = { fg = ac.victoria },
    GitSignsDelete = { fg = ac.central },
    GitSignsTopdelete = { fg = ac.central },
    GitSignsChangedelete = { fg = ac.victoria },
    GitSignsUntracked = { fg = ac.circle },

    -- Line number variants (same fg)
    GitSignsAddNr = { fg = ac.district },
    GitSignsChangeNr = { fg = ac.victoria },
    GitSignsDeleteNr = { fg = ac.central },
    GitSignsTopdeleteNr = { fg = ac.central },
    GitSignsChangedeleteNr = { fg = ac.victoria },
    GitSignsUntrackedNr = { fg = ac.circle },

    -- Line highlight variants (alpha blended onto mantle)
    GitSignsAddLn = { fg = ac.district, bg = util.blend(ac.district, bg.mantle, 0.12) },
    GitSignsChangeLn = { fg = ac.victoria, bg = util.blend(ac.victoria, bg.mantle, 0.12) },
    GitSignsDeleteLn = { fg = ac.central, bg = util.blend(ac.central, bg.mantle, 0.12) },
    GitSignsTopdeleteLn = { fg = ac.central, bg = util.blend(ac.central, bg.mantle, 0.12) },
    GitSignsChangedeleteLn = { fg = ac.victoria, bg = util.blend(ac.victoria, bg.mantle, 0.12) },
    GitSignsUntrackedLn = { fg = ac.circle, bg = util.blend(ac.circle, bg.mantle, 0.12) },

    -- Inline word-diff highlights
    GitSignsAddInline = { bg = util.blend(ac.district, bg.base, 0.25) },
    GitSignsChangeInline = { bg = util.blend(ac.victoria, bg.base, 0.25) },
    GitSignsDeleteInline = { bg = util.blend(ac.central, bg.base, 0.25) },

    -- Blame
    GitSignsCurrentLineBlame = { fg = fg.overlay, italic = true },
    GitSignsCurrentLineBlameNc = { fg = fg.overlay },
  }
end

return M
