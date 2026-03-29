local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local bg = p.backgrounds
  local ac = p.accents

  return {
    -- Explorer / Picker git status (applied to filenames when git_status_hl = true)
    SnacksPickerGitStatusAdded = { fg = ac.district },
    SnacksPickerGitStatusModified = { fg = ac.victoria },
    SnacksPickerGitStatusDeleted = { fg = ac.central },
    SnacksPickerGitStatusRenamed = { fg = ac.victoria },
    SnacksPickerGitStatusUntracked = { fg = ac.district },
    SnacksPickerGitStatusIgnored = { fg = fg.overlay },
    SnacksPickerGitStatusUnmerged = { fg = ac.central },
    SnacksPickerGitStatusStaged = { fg = ac.dlr },

    -- Picker UI
    SnacksPickerMatch = { fg = ac.overground, bold = true },
    SnacksPickerPrompt = { fg = ac.elizabeth },
    SnacksPickerDir = { fg = fg.overlay },
    SnacksPickerFile = { fg = fg.text },
    SnacksPickerDirectory = { fg = ac.victoria },
    SnacksPickerPathIgnored = { fg = fg.overlay },
    SnacksPickerPathHidden = { fg = fg.overlay },
    SnacksPickerDimmed = { fg = fg.overlay },
    SnacksPickerTotals = { fg = fg.overlay },
    SnacksPickerTree = { fg = bg.surface2 },

    -- Dashboard
    SnacksDashboardHeader = { fg = ac.elizabeth },
    SnacksDashboardFooter = { fg = fg.overlay, italic = true },
    SnacksDashboardDesc = { fg = fg.subtext },
    SnacksDashboardKey = { fg = ac.overground, bold = true },
    SnacksDashboardIcon = { fg = ac.victoria },
    SnacksDashboardSpecial = { fg = ac.elizabeth },
    SnacksDashboardDir = { fg = fg.overlay },
    SnacksDashboardFile = { fg = fg.text },
    SnacksDashboardTitle = { fg = ac.elizabeth, bold = true },

    -- Notifier
    SnacksNotifierInfo = { fg = ac.victoria },
    SnacksNotifierWarn = { fg = ac.circle },
    SnacksNotifierError = { fg = ac.central },
    SnacksNotifierDebug = { fg = fg.overlay },
    SnacksNotifierTrace = { fg = ac.elizabeth },
    SnacksNotifierIconInfo = { fg = ac.victoria },
    SnacksNotifierIconWarn = { fg = ac.circle },
    SnacksNotifierIconError = { fg = ac.central },
    SnacksNotifierIconDebug = { fg = fg.overlay },
    SnacksNotifierIconTrace = { fg = ac.elizabeth },
  }
end

return M
