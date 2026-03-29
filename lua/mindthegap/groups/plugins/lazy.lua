local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local bg = p.backgrounds
  local ac = p.accents

  return {
    LazyH1 = { fg = bg.base, bg = ac.elizabeth, bold = true },
    LazyH2 = { fg = ac.elizabeth, bold = true },
    LazyNormal = { fg = fg.text, bg = bg.surface0 },
    LazyBorder = { fg = bg.surface2, bg = bg.surface0 },

    LazyButton = { fg = fg.subtext, bg = bg.surface0 },
    LazyButtonActive = { fg = fg.text, bg = bg.surface1, bold = true },

    LazyComment = { fg = fg.comment },
    LazyCommit = { fg = ac.dlr },
    LazyCommitIssue = { fg = ac.hammersmith },
    LazyCommitType = { fg = ac.elizabeth, bold = true },
    LazyDir = { fg = ac.victoria },
    LazyUrl = { fg = ac.victoria, underline = true },
    LazySpecial = { fg = ac.dlr },

    LazyProgressDone = { fg = ac.elizabeth },
    LazyProgressTodo = { fg = bg.surface2 },

    LazyReasonCmd = { fg = ac.overground },
    LazyReasonEvent = { fg = ac.hammersmith },
    LazyReasonFt = { fg = ac.dlr },
    LazyReasonImport = { fg = ac.victoria },
    LazyReasonKeys = { fg = ac.circle },
    LazyReasonPlugin = { fg = ac.elizabeth },
    LazyReasonRuntime = { fg = fg.subtext },
    LazyReasonSource = { fg = ac.district },
    LazyReasonStart = { fg = fg.text },

    LazyTaskError = { fg = ac.central },
    LazyTaskOutput = { fg = fg.subtext },
  }
end

return M
