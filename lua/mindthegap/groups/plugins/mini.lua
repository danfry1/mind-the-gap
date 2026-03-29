local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local bg = p.backgrounds
  local ac = p.accents

  return {
    -- mini.statusline
    MiniStatuslineModeNormal = { fg = bg.crust, bg = ac.elizabeth, bold = true },
    MiniStatuslineModeInsert = { fg = bg.crust, bg = ac.district, bold = true },
    MiniStatuslineModeVisual = { fg = bg.crust, bg = ac.hammersmith, bold = true },
    MiniStatuslineModeReplace = { fg = bg.crust, bg = ac.central, bold = true },
    MiniStatuslineModeCommand = { fg = bg.crust, bg = ac.circle, bold = true },
    MiniStatuslineModeOther = { fg = bg.crust, bg = ac.dlr, bold = true },
    MiniStatuslineDevinfo = { fg = fg.subtext, bg = bg.surface1 },
    MiniStatuslineFilename = { fg = fg.subtext, bg = bg.mantle },
    MiniStatuslineFileinfo = { fg = fg.subtext, bg = bg.surface1 },
    MiniStatuslineInactive = { fg = fg.overlay, bg = bg.mantle },

    -- mini.tabline
    MiniTablineCurrent = { fg = fg.text, bg = bg.base, bold = true },
    MiniTablineVisible = { fg = fg.subtext, bg = bg.surface0 },
    MiniTablineHidden = { fg = fg.overlay, bg = bg.mantle },
    MiniTablineModifiedCurrent = { fg = ac.district, bg = bg.base, bold = true },
    MiniTablineModifiedVisible = { fg = ac.district, bg = bg.surface0 },
    MiniTablineModifiedHidden = { fg = ac.district, bg = bg.mantle },
    MiniTablineFill = { bg = bg.crust },
    MiniTablineTabpagesection = { fg = bg.crust, bg = ac.elizabeth, bold = true },

    -- mini.cursorword
    MiniCursorword = { bg = bg.surface1 },
    MiniCursorwordCurrent = { bg = bg.surface1 },

    -- mini.indentscope
    MiniIndentscopeSymbol = { fg = ac.elizabeth },

    -- mini.pick
    MiniPickBorder = { fg = bg.surface2, bg = bg.surface0 },
    MiniPickBorderBusy = { fg = ac.circle, bg = bg.surface0 },
    MiniPickBorderText = { fg = ac.elizabeth, bg = bg.surface0, bold = true },
    MiniPickIconDirectory = { fg = ac.victoria },
    MiniPickIconFile = { fg = fg.text },
    MiniPickHeader = { fg = ac.elizabeth, bold = true },
    MiniPickMatchCurrent = { bg = bg.surface1, bold = true },
    MiniPickMatchMarked = { fg = ac.district, bg = bg.surface1 },
    MiniPickMatchRanges = { fg = ac.overground, bold = true },
    MiniPickNormal = { fg = fg.text, bg = bg.surface0 },
    MiniPickPreviewLine = { bg = bg.surface1 },
    MiniPickPreviewRegion = { bg = bg.surface1 },
    MiniPickPrompt = { fg = ac.elizabeth, bg = bg.surface0 },

    -- mini.jump / mini.jump2d
    MiniJump = { fg = bg.crust, bg = ac.overground, bold = true },
    MiniJump2dSpot = { fg = ac.overground, bold = true },
    MiniJump2dSpotAhead = { fg = ac.dlr },
    MiniJump2dSpotUnique = { fg = ac.overground, bold = true },
    MiniJump2dDim = { fg = fg.overlay },

    -- mini.hipatterns
    MiniHipatternsFixme = { fg = bg.crust, bg = ac.central, bold = true },
    MiniHipatternsHack = { fg = bg.crust, bg = ac.circle, bold = true },
    MiniHipatternsNote = { fg = bg.crust, bg = ac.victoria, bold = true },
    MiniHipatternsTodo = { fg = bg.crust, bg = ac.district, bold = true },

    -- mini.diff
    MiniDiffSignAdd = { fg = ac.district },
    MiniDiffSignChange = { fg = ac.victoria },
    MiniDiffSignDelete = { fg = ac.central },
    MiniDiffOverAdd = { link = "DiffAdd" },
    MiniDiffOverChange = { link = "DiffChange" },
    MiniDiffOverContext = { link = "DiffChange" },
    MiniDiffOverDelete = { link = "DiffDelete" },

    -- mini.files
    MiniFilesDirectory = { fg = ac.victoria, bold = true },
    MiniFilesFile = { fg = fg.text },
    MiniFilesCursorLine = { bg = bg.surface1 },
    MiniFilesNormal = { fg = fg.text, bg = bg.surface0 },
    MiniFilesBorder = { fg = bg.surface2, bg = bg.surface0 },
    MiniFilesBorderModified = { fg = ac.circle, bg = bg.surface0 },
    MiniFilesTitle = { fg = ac.elizabeth, bg = bg.surface0, bold = true },
    MiniFilesTitleFocused = { fg = ac.overground, bg = bg.surface0, bold = true },

    -- mini.notify
    MiniNotifyBorder = { fg = bg.surface2, bg = bg.surface0 },
    MiniNotifyNormal = { fg = fg.text, bg = bg.surface0 },
    MiniNotifyTitle = { fg = ac.elizabeth, bg = bg.surface0, bold = true },
  }
end

return M
