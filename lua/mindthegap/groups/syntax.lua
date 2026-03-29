local M = {}

function M.get(p, config)
  local fg = p.foregrounds
  local ac = p.accents

  local italic = config.italics

  return {
    -- ── Legacy Vim syntax groups ─────────────────────────────────────────
    Comment = { fg = fg.comment, italic = italic },
    Constant = { fg = ac.overground },
    String = { fg = ac.district },
    Character = { fg = ac.district },
    Number = { fg = ac.overground },
    Float = { fg = ac.overground },
    Boolean = { fg = ac.overground },
    Identifier = { fg = fg.text },
    Function = { fg = fg.text },
    Statement = { fg = ac.elizabeth, italic = italic },
    Conditional = { fg = ac.hammersmith },
    Repeat = { fg = ac.hammersmith },
    Label = { fg = ac.hammersmith },
    Operator = { fg = ac.hammersmith },
    Keyword = { fg = ac.elizabeth, italic = italic },
    Exception = { fg = ac.hammersmith },
    PreProc = { fg = ac.dlr },
    Include = { fg = ac.elizabeth, italic = italic },
    Define = { fg = ac.elizabeth },
    Macro = { fg = ac.dlr },
    PreCondit = { fg = ac.dlr },
    Type = { fg = ac.overground },
    StorageClass = { fg = ac.elizabeth, italic = italic },
    Structure = { fg = ac.overground },
    Typedef = { fg = ac.overground },
    Special = { fg = ac.dlr },
    SpecialChar = { fg = ac.dlr },
    Tag = { fg = ac.overground },
    Delimiter = { fg = fg.overlay },
    SpecialComment = { fg = fg.overlay, italic = italic },
    Debug = { fg = ac.central },
    Underlined = { underline = true },
    Ignore = { fg = fg.overlay },
    Error = { fg = ac.central },
    Todo = { fg = ac.circle, bold = true },

    -- ── Treesitter — variables ───────────────────────────────────────────
    ["@variable"] = { fg = fg.text },
    ["@variable.builtin"] = { fg = fg.text, italic = italic },
    ["@variable.parameter"] = { fg = fg.text },
    ["@variable.member"] = { fg = fg.text },

    -- ── Treesitter — constants ───────────────────────────────────────────
    ["@constant"] = { fg = ac.overground },
    ["@constant.builtin"] = { fg = ac.elizabeth, italic = italic },
    ["@constant.macro"] = { fg = ac.dlr },

    -- ── Treesitter — modules / namespaces ────────────────────────────────
    ["@module"] = { fg = fg.text },
    ["@module.builtin"] = { fg = fg.text, italic = italic },
    ["@label"] = { fg = ac.hammersmith },

    -- ── Treesitter — literals ────────────────────────────────────────────
    ["@string"] = { fg = ac.district },
    ["@string.documentation"] = { fg = ac.district, italic = italic },
    ["@string.escape"] = { fg = ac.dlr },
    ["@string.regexp"] = { fg = ac.dlr },
    ["@string.regex"] = { link = "@string.regexp" },
    ["@string.special"] = { fg = ac.dlr },
    ["@string.special.symbol"] = { fg = ac.overground },
    ["@string.special.url"] = { fg = ac.victoria, underline = true },
    ["@character"] = { fg = ac.district },
    ["@character.special"] = { fg = ac.dlr },
    ["@boolean"] = { fg = ac.overground },
    ["@number"] = { fg = ac.circle },
    ["@number.float"] = { fg = ac.circle },

    -- ── Treesitter — types ───────────────────────────────────────────────
    ["@type"] = { fg = ac.overground },
    ["@type.builtin"] = { fg = ac.elizabeth, italic = italic },
    ["@type.definition"] = { fg = ac.overground },
    ["@attribute"] = { fg = ac.overground },
    ["@attribute.builtin"] = { fg = ac.overground, italic = italic },
    ["@property"] = { fg = fg.text },

    -- ── Treesitter — functions ───────────────────────────────────────────
    ["@function"] = { fg = fg.text },
    ["@function.builtin"] = { fg = ac.victoria, italic = italic },
    ["@function.call"] = { fg = ac.victoria },
    ["@function.macro"] = { fg = ac.dlr },
    ["@function.method"] = { fg = fg.text },
    ["@function.method.call"] = { fg = ac.victoria },
    ["@constructor"] = { fg = ac.overground },
    ["@operator"] = { fg = ac.hammersmith },

    -- ── Treesitter — keywords ────────────────────────────────────────────
    ["@keyword"] = { fg = ac.elizabeth, italic = italic },
    ["@keyword.coroutine"] = { fg = ac.elizabeth, italic = italic },
    ["@keyword.function"] = { fg = ac.elizabeth, italic = italic },
    ["@keyword.operator"] = { fg = ac.hammersmith },
    ["@keyword.import"] = { fg = ac.elizabeth, italic = italic },
    ["@keyword.storage"] = { fg = ac.elizabeth, italic = italic },
    ["@keyword.repeat"] = { fg = ac.hammersmith },
    ["@keyword.return"] = { fg = ac.hammersmith },
    ["@keyword.debug"] = { fg = ac.central },
    ["@keyword.exception"] = { fg = ac.hammersmith },
    ["@keyword.conditional"] = { fg = ac.hammersmith },
    ["@keyword.conditional.ternary"] = { fg = ac.hammersmith },
    ["@keyword.directive"] = { fg = ac.dlr },
    ["@keyword.directive.define"] = { fg = ac.dlr },

    -- ── Treesitter — punctuation ─────────────────────────────────────────
    ["@punctuation.delimiter"] = { fg = fg.overlay },
    ["@punctuation.bracket"] = { fg = fg.overlay },
    ["@punctuation.special"] = { fg = ac.dlr },

    -- ── Treesitter — comments ────────────────────────────────────────────
    ["@comment"] = { fg = fg.comment, italic = italic },
    ["@comment.documentation"] = { fg = fg.comment, italic = italic },
    ["@comment.error"] = { fg = ac.central, bold = true },
    ["@comment.warning"] = { fg = ac.circle, bold = true },
    ["@comment.todo"] = { fg = ac.circle, bold = true },
    ["@comment.note"] = { fg = ac.victoria, bold = true },

    -- ── Treesitter — markup ──────────────────────────────────────────────
    ["@markup.strong"] = { fg = ac.overground, bold = true },
    ["@markup.italic"] = { fg = ac.hammersmith, italic = true },
    ["@markup.strikethrough"] = { fg = fg.overlay, strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { fg = ac.elizabeth, bold = true },
    ["@markup.heading.1"] = { fg = ac.elizabeth, bold = true },
    ["@markup.heading.2"] = { fg = ac.hammersmith, bold = true },
    ["@markup.heading.3"] = { fg = ac.overground, bold = true },
    ["@markup.heading.4"] = { fg = ac.district, bold = true },
    ["@markup.heading.5"] = { fg = ac.victoria, bold = true },
    ["@markup.heading.6"] = { fg = ac.dlr, bold = true },
    ["@markup.quote"] = { fg = fg.subtext, italic = italic },
    ["@markup.math"] = { fg = ac.dlr },
    ["@markup.environment"] = { fg = ac.overground },
    ["@markup.link"] = { fg = ac.victoria, underline = true },
    ["@markup.link.label"] = { fg = ac.victoria },
    ["@markup.link.url"] = { fg = ac.victoria, underline = true },
    ["@markup.raw"] = { fg = ac.district },
    ["@markup.raw.block"] = { fg = ac.district },
    ["@markup.list"] = { fg = ac.hammersmith },
    ["@markup.list.checked"] = { fg = ac.district },
    ["@markup.list.unchecked"] = { fg = fg.overlay },

    -- ── Treesitter — tags (HTML/JSX) ─────────────────────────────────────
    ["@tag"] = { fg = ac.overground },
    ["@tag.builtin"] = { fg = ac.dlr },
    ["@tag.attribute"] = { fg = ac.victoria, italic = italic },
    ["@tag.delimiter"] = { fg = fg.overlay },

    -- ── Treesitter — diff ────────────────────────────────────────────────
    ["@diff.plus"] = { fg = ac.district },
    ["@diff.minus"] = { fg = ac.central },
    ["@diff.delta"] = { fg = ac.victoria },
  }
end

return M
