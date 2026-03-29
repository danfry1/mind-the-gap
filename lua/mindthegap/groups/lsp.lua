local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local bg = p.backgrounds
  local ac = p.accents
  local util = require("mindthegap.util")

  local italic = config.italics

  return {
    -- ── Diagnostics — base ───────────────────────────────────────────────
    DiagnosticError = { fg = ac.central },
    DiagnosticWarn = { fg = ac.circle },
    DiagnosticInfo = { fg = ac.victoria },
    DiagnosticHint = { fg = ac.dlr },
    DiagnosticOk = { fg = ac.district },

    -- ── Diagnostics — virtual text (alpha blended onto base) ────────────
    DiagnosticVirtualTextError = { fg = ac.central, bg = util.blend(ac.central, bg.base, 0.08) },
    DiagnosticVirtualTextWarn = { fg = ac.circle, bg = util.blend(ac.circle, bg.base, 0.08) },
    DiagnosticVirtualTextInfo = { fg = ac.victoria, bg = util.blend(ac.victoria, bg.base, 0.08) },
    DiagnosticVirtualTextHint = { fg = ac.dlr, bg = util.blend(ac.dlr, bg.base, 0.08) },
    DiagnosticVirtualTextOk = { fg = ac.district, bg = util.blend(ac.district, bg.base, 0.08) },

    -- ── Diagnostics — underline ──────────────────────────────────────────
    DiagnosticUnderlineError = { undercurl = true, sp = ac.central },
    DiagnosticUnderlineWarn = { undercurl = true, sp = ac.circle },
    DiagnosticUnderlineInfo = { undercurl = true, sp = ac.victoria },
    DiagnosticUnderlineHint = { undercurl = true, sp = ac.dlr },
    DiagnosticUnderlineOk = { undercurl = true, sp = ac.district },

    -- ── Diagnostics — sign column ────────────────────────────────────────
    DiagnosticSignError = { fg = ac.central },
    DiagnosticSignWarn = { fg = ac.circle },
    DiagnosticSignInfo = { fg = ac.victoria },
    DiagnosticSignHint = { fg = ac.dlr },
    DiagnosticSignOk = { fg = ac.district },

    -- ── Diagnostics — floating window ────────────────────────────────────
    DiagnosticFloatingError = { fg = ac.central },
    DiagnosticFloatingWarn = { fg = ac.circle },
    DiagnosticFloatingInfo = { fg = ac.victoria },
    DiagnosticFloatingHint = { fg = ac.dlr },
    DiagnosticFloatingOk = { fg = ac.district },

    -- ── LSP references ───────────────────────────────────────────────────
    LspReferenceText = { bg = bg.surface1 },
    LspReferenceRead = { bg = bg.surface1 },
    LspReferenceWrite = { bg = bg.surface1, bold = true },

    -- ── LSP misc ─────────────────────────────────────────────────────────
    LspSignatureActiveParameter = { fg = ac.overground, bold = true },
    LspCodeLens = { fg = fg.overlay },
    LspCodeLensSeparator = { fg = fg.overlay },
    LspInlayHint = { fg = fg.overlay, bg = bg.surface0, italic = true },
    LspInfoBorder = { fg = bg.surface2, bg = bg.surface0 },

    -- ── LSP semantic tokens — types ──────────────────────────────────────
    ["@lsp.type.class"] = { fg = ac.overground },
    ["@lsp.type.enum"] = { fg = ac.overground },
    ["@lsp.type.enumMember"] = { fg = ac.overground },
    ["@lsp.type.struct"] = { fg = ac.overground },
    ["@lsp.type.interface"] = { fg = ac.overground, italic = italic },
    ["@lsp.type.typeParameter"] = { fg = ac.overground, italic = italic },
    ["@lsp.type.type"] = { fg = ac.overground },
    ["@lsp.type.namespace"] = { fg = fg.text },

    -- ── LSP semantic tokens — functions ─────────────────────────────────
    ["@lsp.type.function"] = { fg = ac.victoria },
    ["@lsp.type.method"] = { fg = ac.victoria },

    -- ── LSP semantic tokens — variables / parameters ─────────────────────
    ["@lsp.type.variable"] = { fg = fg.text },
    ["@lsp.type.parameter"] = { fg = fg.text },
    ["@lsp.type.property"] = { fg = fg.text },

    -- ── LSP semantic tokens — keywords ───────────────────────────────────
    ["@lsp.type.keyword"] = { fg = ac.elizabeth },
    ["@lsp.type.modifier"] = { fg = ac.elizabeth },
    ["@lsp.type.decorator"] = { fg = ac.overground },

    -- ── LSP semantic tokens — modifiers ──────────────────────────────────
    ["@lsp.typemod.function.defaultLibrary"] = { fg = ac.victoria, italic = italic },
    ["@lsp.typemod.method.defaultLibrary"] = { fg = ac.victoria, italic = italic },
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = fg.text, italic = italic },
    ["@lsp.typemod.variable.readonly"] = { fg = fg.text },
    ["@lsp.typemod.variable.static"] = { fg = fg.text },
    ["@lsp.typemod.property.readonly"] = { fg = fg.text, italic = italic },
    ["@lsp.typemod.class.defaultLibrary"] = { fg = ac.overground },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = ac.overground, italic = italic },
  }
end

return M
