vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "slate-ash"
vim.o.termguicolors = true

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Palette
local c = {
  -- Backgrounds (Ash warm-gray)
  bg        = "#1a1b1e",
  bg2       = "#232428",
  bg3       = "#2a2b30",
  bg_float  = "#1e1f23",

  -- Foregrounds (Slate cool tones)
  fg        = "#adb5c0",
  fg_dim    = "#7a8490",
  fg_faint  = "#4e5560",

  -- Syntax (Slate)
  keyword   = "#6b8fb5",   -- local, function, if, return
  func      = "#7a9e8a",   -- function names
  string    = "#7a9e6a",   -- strings
  param     = "#9fa8b0",   -- parameters, variables
  comment   = "#5a6472",   -- comments
  type      = "#7a9eb5",   -- types, classes
  number    = "#9fa87a",   -- numbers, booleans
  operator  = "#8a9ab0",   -- operators
  constant  = "#b5a07a",   -- constants

  -- UI
  border       = "#2e3038",
  selection    = "#2a3140",
  cursorline   = "#1e2025",
  linenr       = "#6a7078",
  cursorlinenr = "#d0d4d8",

  -- Diagnostics
  error     = "#a05a5a",
  warn      = "#a08a5a",
  info      = "#5a7a9a",
  hint      = "#5a8a7a",

  -- Git
  git_add   = "#5a7a5a",
  git_change= "#5a6a8a",
  git_del   = "#8a5a5a",

  none      = "NONE",
}

-- Editor UI
hi("Normal",          { fg = c.fg,        bg = c.bg })
hi("NormalFloat",     { fg = c.fg,        bg = c.bg_float })
hi("NormalNC",        { fg = c.fg_dim,    bg = c.bg })
hi("ColorColumn",     { bg = c.bg2 })
hi("Conceal",         { fg = c.fg_faint })
hi("CursorLine",      { bg = c.cursorline })
hi("CursorColumn",    { bg = c.cursorline })
hi("CursorLineNr",    { fg = c.cursorlinenr, bold = true })
hi("LineNr",          { fg = c.linenr })
hi("SignColumn",      { fg = c.linenr,    bg = c.bg })
hi("FoldColumn",      { fg = c.linenr,    bg = c.bg })
hi("Folded",          { fg = c.comment,   bg = c.bg2 })
hi("VertSplit",       { fg = c.border,    bg = c.bg })
hi("WinSeparator",    { fg = c.border,    bg = c.bg })
hi("StatusLine",      { fg = c.fg_dim,    bg = c.bg2 })
hi("StatusLineNC",    { fg = c.fg_faint,  bg = c.bg2 })
hi("TabLine",         { fg = c.fg_dim,    bg = c.bg2 })
hi("TabLineFill",     { bg = c.bg2 })
hi("TabLineSel",      { fg = c.fg,        bg = c.bg,  bold = true })
hi("Pmenu",           { fg = c.fg,        bg = c.bg2 })
hi("PmenuSel",        { fg = c.fg,        bg = c.selection, bold = true })
hi("PmenuSbar",       { bg = c.bg3 })
hi("PmenuThumb",      { bg = c.comment })
hi("FloatBorder",     { fg = c.border,    bg = c.bg_float })
hi("Visual",          { bg = c.selection })
hi("VisualNOS",       { bg = c.selection })
hi("Search",          { fg = c.bg,        bg = c.keyword })
hi("IncSearch",       { fg = c.bg,        bg = c.func,    bold = true })
hi("CurSearch",       { fg = c.bg,        bg = c.func,    bold = true })
hi("MatchParen",      { fg = c.func,      bold = true,    underline = true })
hi("NonText",         { fg = c.fg_faint })
hi("SpecialKey",      { fg = c.fg_faint })
hi("Whitespace",      { fg = c.fg_faint })
hi("EndOfBuffer",     { fg = c.bg2 })
hi("Directory",       { fg = c.keyword })
hi("Title",           { fg = c.func,      bold = true })
hi("Question",        { fg = c.func })
hi("MoreMsg",         { fg = c.func })
hi("ModeMsg",         { fg = c.fg,        bold = true })
hi("ErrorMsg",        { fg = c.error })
hi("WarningMsg",      { fg = c.warn })
hi("SpellBad",        { undercurl = true, sp = c.error })
hi("SpellCap",        { undercurl = true, sp = c.warn })
hi("SpellLocal",      { undercurl = true, sp = c.info })
hi("SpellRare",       { undercurl = true, sp = c.hint })

-- Syntax
hi("Comment",         { fg = c.comment,   italic = true })
hi("Constant",        { fg = c.constant })
hi("String",          { fg = c.string })
hi("Character",       { fg = c.string })
hi("Number",          { fg = c.number })
hi("Boolean",         { fg = c.number })
hi("Float",           { fg = c.number })
hi("Identifier",      { fg = c.param })
hi("Function",        { fg = c.func })
hi("Statement",       { fg = c.keyword })
hi("Conditional",     { fg = c.keyword })
hi("Repeat",          { fg = c.keyword })
hi("Label",           { fg = c.keyword })
hi("Operator",        { fg = c.operator })
hi("Keyword",         { fg = c.keyword })
hi("Exception",       { fg = c.keyword })
hi("PreProc",         { fg = c.type })
hi("Include",         { fg = c.keyword })
hi("Define",          { fg = c.keyword })
hi("Macro",           { fg = c.type })
hi("PreCondit",       { fg = c.type })
hi("Type",            { fg = c.type })
hi("StorageClass",    { fg = c.keyword })
hi("Structure",       { fg = c.type })
hi("Typedef",         { fg = c.type })
hi("Special",         { fg = c.constant })
hi("SpecialChar",     { fg = c.string })
hi("Delimiter",       { fg = c.fg_dim })
hi("SpecialComment",  { fg = c.comment,   italic = true })
hi("Debug",           { fg = c.warn })
hi("Underlined",      { underline = true })
hi("Ignore",          { fg = c.fg_faint })
hi("Error",           { fg = c.error })
hi("Todo",            { fg = c.keyword,   bold = true })

-- Treesitter
hi("@variable",           { fg = c.param })
hi("@variable.builtin",   { fg = c.keyword })
hi("@variable.parameter", { fg = c.param })
hi("@variable.member",    { fg = c.param })
hi("@constant",           { fg = c.constant })
hi("@constant.builtin",   { fg = c.number })
hi("@string",             { fg = c.string })
hi("@string.escape",      { fg = c.constant })
hi("@character",          { fg = c.string })
hi("@number",             { fg = c.number })
hi("@boolean",            { fg = c.number })
hi("@float",              { fg = c.number })
hi("@function",           { fg = c.func })
hi("@function.builtin",   { fg = c.func })
hi("@function.call",      { fg = c.func })
hi("@function.method",    { fg = c.func })
hi("@constructor",        { fg = c.type })
hi("@keyword",            { fg = c.keyword })
hi("@keyword.function",   { fg = c.keyword })
hi("@keyword.return",     { fg = c.keyword })
hi("@keyword.operator",   { fg = c.keyword })
hi("@keyword.import",     { fg = c.keyword })
hi("@operator",           { fg = c.operator })
hi("@punctuation",        { fg = c.fg_dim })
hi("@punctuation.bracket",{ fg = c.fg_dim })
hi("@punctuation.delimiter",{ fg = c.fg_dim })
hi("@type",               { fg = c.type })
hi("@type.builtin",       { fg = c.type })
hi("@attribute",          { fg = c.constant })
hi("@comment",            { fg = c.comment,  italic = true })
hi("@tag",                { fg = c.keyword })
hi("@tag.attribute",      { fg = c.param })
hi("@tag.delimiter",      { fg = c.fg_dim })
hi("@markup.heading",     { fg = c.func,     bold = true })
hi("@markup.link",        { fg = c.keyword,  underline = true })
hi("@markup.raw",         { fg = c.string })

-- LSP
hi("LspReferenceText",    { bg = c.bg3 })
hi("LspReferenceRead",    { bg = c.bg3 })
hi("LspReferenceWrite",   { bg = c.bg3,      underline = true })
hi("LspInlayHint",        { fg = c.comment,  bg = c.bg2,  italic = true })

-- Diagnostics
hi("DiagnosticError",     { fg = c.error })
hi("DiagnosticWarn",      { fg = c.warn })
hi("DiagnosticInfo",      { fg = c.info })
hi("DiagnosticHint",      { fg = c.hint })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.error })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.warn })
hi("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.info })
hi("DiagnosticUnderlineHint",  { undercurl = true, sp = c.hint })
hi("DiagnosticVirtualTextError", { fg = c.error, bg = c.bg2 })
hi("DiagnosticVirtualTextWarn",  { fg = c.warn,  bg = c.bg2 })
hi("DiagnosticVirtualTextInfo",  { fg = c.info,  bg = c.bg2 })
hi("DiagnosticVirtualTextHint",  { fg = c.hint,  bg = c.bg2 })
hi("DiagnosticSignError", { fg = c.error })
hi("DiagnosticSignWarn",  { fg = c.warn })
hi("DiagnosticSignInfo",  { fg = c.info })
hi("DiagnosticSignHint",  { fg = c.hint })

-- Git signs (gitsigns.nvim)
hi("GitSignsAdd",         { fg = c.git_add })
hi("GitSignsChange",      { fg = c.git_change })
hi("GitSignsDelete",      { fg = c.git_del })

-- nvim-cmp
hi("CmpItemAbbr",         { fg = c.fg })
hi("CmpItemAbbrMatch",    { fg = c.keyword,  bold = true })
hi("CmpItemAbbrMatchFuzzy",{ fg = c.keyword })
hi("CmpItemKindFunction", { fg = c.func })
hi("CmpItemKindMethod",   { fg = c.func })
hi("CmpItemKindVariable", { fg = c.param })
hi("CmpItemKindField",    { fg = c.param })
hi("CmpItemKindKeyword",  { fg = c.keyword })
hi("CmpItemKindText",     { fg = c.fg_dim })
hi("CmpItemMenu",         { fg = c.comment })

-- Telescope
hi("TelescopeBorder",     { fg = c.border })
hi("TelescopeNormal",     { fg = c.fg,    bg = c.bg_float })
hi("TelescopePromptPrefix",{ fg = c.keyword })
hi("TelescopeSelection",  { bg = c.selection })
hi("TelescopeMatching",   { fg = c.keyword, bold = true })

-- Flash
hi("FlashLabel",          { fg = c.bg,    bg = c.func,    bold = true })
hi("FlashMatch",          { fg = c.bg,    bg = c.keyword })
hi("FlashCurrent",        { fg = c.bg,    bg = c.constant, bold = true })
