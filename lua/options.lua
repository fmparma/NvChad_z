require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
-- Enables automatic C program indenting.
o.cindent = true

vim.opt.colorcolumn = {80, 100}
vim.opt.relativenumber = true
-- local wo = vim.wo
-- 
-- wo.colorcolumn = "80" 

-- Disable rustfmt timeout
vim.g.rustfmt_autosave_ignore_neovim_timeout = 1

