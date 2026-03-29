local M = {}

local CORE_MODULES = {
  "mindthegap.groups.editor",
  "mindthegap.groups.syntax",
  "mindthegap.groups.lsp",
}

local PLUGIN_MODULES = {
  "mindthegap.groups.plugins.telescope",
  "mindthegap.groups.plugins.cmp",
  "mindthegap.groups.plugins.gitsigns",
  "mindthegap.groups.plugins.mini",
  "mindthegap.groups.plugins.noice",
  "mindthegap.groups.plugins.notify",
  "mindthegap.groups.plugins.trouble",
  "mindthegap.groups.plugins.flash",
  "mindthegap.groups.plugins.neo-tree",
  "mindthegap.groups.plugins.oil",
  "mindthegap.groups.plugins.lazy",
  "mindthegap.groups.plugins.which-key",
  "mindthegap.groups.plugins.indent-blankline",
  "mindthegap.groups.plugins.dashboard",
  "mindthegap.groups.plugins.snacks",
}

function M.apply(config)
  local p = vim.deepcopy(require("mindthegap.palette"))

  -- Apply palette overrides
  if config.palette_overrides then
    local overrides = config.palette_overrides
    if type(overrides) == "function" then
      overrides = overrides(p, "dark")
    end
    if overrides then
      p = vim.tbl_deep_extend("force", p, overrides)
    end
  end

  -- Collect all highlight groups
  local groups = {}
  for _, mod_name in ipairs(CORE_MODULES) do
    local ok, mod = pcall(require, mod_name)
    if ok and mod.get then
      for k, v in pairs(mod.get(p, config)) do
        groups[k] = v
      end
    end
  end
  for _, mod_name in ipairs(PLUGIN_MODULES) do
    local ok, mod = pcall(require, mod_name)
    if ok and mod.get then
      for k, v in pairs(mod.get(p, config)) do
        groups[k] = v
      end
    end
  end

  -- Apply custom highlights
  if config.custom_highlights then
    local custom = config.custom_highlights
    if type(custom) == "function" then
      custom = custom(p, "dark")
    end
    if custom then
      for k, v in pairs(custom) do
        groups[k] = vim.tbl_extend("force", groups[k] or {}, v)
      end
    end
  end

  -- Set all highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  -- Terminal ANSI colors
  vim.g.terminal_color_0 = p.ansi.black
  vim.g.terminal_color_1 = p.ansi.red
  vim.g.terminal_color_2 = p.ansi.green
  vim.g.terminal_color_3 = p.ansi.yellow
  vim.g.terminal_color_4 = p.ansi.blue
  vim.g.terminal_color_5 = p.ansi.magenta
  vim.g.terminal_color_6 = p.ansi.cyan
  vim.g.terminal_color_7 = p.ansi.white
  vim.g.terminal_color_8 = p.ansi.brightBlack
  vim.g.terminal_color_9 = p.ansi.brightRed
  vim.g.terminal_color_10 = p.ansi.brightGreen
  vim.g.terminal_color_11 = p.ansi.brightYellow
  vim.g.terminal_color_12 = p.ansi.brightBlue
  vim.g.terminal_color_13 = p.ansi.brightMagenta
  vim.g.terminal_color_14 = p.ansi.brightCyan
  vim.g.terminal_color_15 = p.ansi.brightWhite
end

return M
