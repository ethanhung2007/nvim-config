vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.cmd.colorscheme("slate-ash")

vim.opt.number = true          
vim.opt.relativenumber = true  

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "<Esc>", "<cmd>nohl<cr>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.updatetime = 500

vim.diagnostic.config({
  signs = { severity = { min = vim.diagnostic.severity.ERROR } },
  virtual_text = false,
  underline = { severity = { min = vim.diagnostic.severity.ERROR } },
  float = { severity = { min = vim.diagnostic.severity.ERROR } },
})

-- Auto-show diagnostic float when cursor rests on a line
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})

require("lazy").setup("plugins")

