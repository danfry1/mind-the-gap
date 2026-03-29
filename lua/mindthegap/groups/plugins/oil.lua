local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local ac = p.accents

  return {
    OilDir = { fg = ac.victoria, bold = true },
    OilDirIcon = { fg = ac.victoria },
    OilLink = { fg = ac.dlr },
    OilLinkTarget = { fg = fg.overlay, italic = true },
    OilFile = { fg = fg.text },
    OilSocket = { fg = ac.elizabeth },

    -- Change type indicators
    OilCreate = { fg = ac.district },
    OilDelete = { fg = ac.central },
    OilMove = { fg = ac.circle },
    OilCopy = { fg = ac.victoria },
    OilChange = { fg = ac.victoria },
    OilRestore = { fg = ac.dlr },
    OilPurge = { fg = ac.central, bold = true },
    OilTrash = { fg = ac.central },
    OilTrashSourcePath = { fg = fg.overlay, italic = true },
  }
end

return M
