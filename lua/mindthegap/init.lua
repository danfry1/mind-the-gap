local M = {}

M.config = {
  transparent = false,
  italics = true,
  palette_overrides = nil,
  custom_highlights = nil,
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "mindthegap"
  require("mindthegap.theme").apply(M.config)
end

-- Allow direct require("mindthegap").setup() + colorscheme mindthegap
-- The colorscheme command triggers colors/mindthegap.lua which calls load()
return M
