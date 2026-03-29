local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local bg = p.backgrounds
  local ac = p.accents

  return {
    TelescopeNormal = { fg = fg.text, bg = bg.surface0 },
    TelescopeBorder = { fg = bg.surface0, bg = bg.surface0 },

    TelescopePromptNormal = { fg = fg.text, bg = bg.surface1 },
    TelescopePromptBorder = { fg = bg.surface1, bg = bg.surface1 },
    TelescopePromptTitle = { fg = bg.base, bg = ac.hammersmith, bold = true },
    TelescopePromptPrefix = { fg = ac.hammersmith, bg = bg.surface1 },
    TelescopePromptCounter = { fg = fg.overlay, bg = bg.surface1 },

    TelescopePreviewNormal = { fg = fg.text, bg = bg.mantle },
    TelescopePreviewBorder = { fg = bg.mantle, bg = bg.mantle },
    TelescopePreviewTitle = { fg = bg.base, bg = ac.district, bold = true },

    TelescopeResultsNormal = { fg = fg.text, bg = bg.surface0 },
    TelescopeResultsBorder = { fg = bg.surface0, bg = bg.surface0 },
    TelescopeResultsTitle = { fg = bg.base, bg = ac.elizabeth, bold = true },

    TelescopeSelection = { fg = fg.text, bg = bg.surface1, bold = true },
    TelescopeSelectionCaret = { fg = ac.hammersmith, bg = bg.surface1 },
    TelescopeMultiSelection = { fg = fg.text, bg = bg.surface1 },
    TelescopeMultiIcon = { fg = ac.hammersmith },

    TelescopeMatching = { fg = ac.overground, bold = true },
  }
end

return M
