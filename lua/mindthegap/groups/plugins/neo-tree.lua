local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local bg = p.backgrounds
  local ac = p.accents

  return {
    NeoTreeNormal = { fg = fg.text, bg = bg.mantle },
    NeoTreeNormalNC = { fg = fg.text, bg = bg.mantle },
    NeoTreeEndOfBuffer = { fg = bg.mantle, bg = bg.mantle },
    NeoTreeCursorLine = { bg = bg.surface0 },

    NeoTreeRootName = { fg = ac.elizabeth, bold = true },
    NeoTreeDirectoryName = { fg = ac.victoria },
    NeoTreeDirectoryIcon = { fg = ac.victoria },
    NeoTreeFileName = { fg = fg.text },
    NeoTreeFileIcon = { fg = fg.subtext },
    NeoTreeFileNameOpened = { fg = fg.text, bold = true },

    NeoTreeIndentMarker = { fg = bg.surface1 },
    NeoTreeExpander = { fg = fg.overlay },
    NeoTreeSymbolicLinkTarget = { fg = ac.dlr },
    NeoTreeFloatTitle = { fg = ac.elizabeth, bold = true },
    NeoTreeTitleBar = { fg = bg.base, bg = ac.elizabeth, bold = true },
    NeoTreeWinSeparator = { fg = bg.mantle, bg = bg.mantle },

    NeoTreeFilterTerm = { fg = ac.overground, bold = true },
    NeoTreeModified = { fg = ac.victoria },
    NeoTreeDimText = { fg = fg.overlay },
    NeoTreeHiddenByName = { fg = fg.overlay },

    -- Git status
    NeoTreeGitAdded = { fg = ac.district },
    NeoTreeGitConflict = { fg = ac.central },
    NeoTreeGitDeleted = { fg = ac.central },
    NeoTreeGitIgnored = { fg = fg.overlay },
    NeoTreeGitModified = { fg = ac.victoria },
    NeoTreeGitUnstaged = { fg = ac.circle },
    NeoTreeGitUntracked = { fg = ac.district },
    NeoTreeGitStaged = { fg = ac.district },
  }
end

return M
