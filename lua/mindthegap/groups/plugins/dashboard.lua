local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local bg = p.backgrounds
  local ac = p.accents

  return {
    -- dashboard-nvim
    DashboardHeader = { fg = ac.elizabeth },
    DashboardFooter = { fg = fg.overlay, italic = true },
    DashboardDesc = { fg = fg.subtext },
    DashboardKey = { fg = ac.overground, bold = true },
    DashboardIcon = { fg = ac.victoria },
    DashboardShortCut = { fg = ac.hammersmith },
    DashboardCenter = { fg = fg.text },
    DashboardProjectTitle = { fg = ac.elizabeth, bold = true },
    DashboardProjectTitleIcon = { fg = ac.victoria },
    DashboardProjectIcon = { fg = ac.victoria },
    DashboardMruTitle = { fg = ac.elizabeth, bold = true },
    DashboardMruIcon = { fg = ac.victoria },
    DashboardFiles = { fg = fg.text },

    -- alpha-nvim
    AlphaHeader = { fg = ac.elizabeth },
    AlphaButtons = { fg = fg.text },
    AlphaShortcut = { fg = ac.overground, bold = true },
    AlphaFooter = { fg = fg.overlay, italic = true },
  }
end

return M
