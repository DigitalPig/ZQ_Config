-- Basic options
vim.g.mapleader = ";"
vim.g.maplocalleader = "\\"

-- General settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Visual
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80,120"
vim.opt.cursorline = true
vim.opt.showmode = false

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Backup and undo
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.pumheight = 10

-- Misc
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.compatible = false

-- Filetype
vim.cmd("filetype on")
vim.cmd("filetype plugin on")