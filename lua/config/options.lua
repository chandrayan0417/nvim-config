-- Set leader key to space
vim.g.mapleader = " "
-- Set leader key to space
vim.g.maplocalleader = " "

-- Number of spaces a tab represents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Use appropriate when using indent command
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- Indenting correctly after { etc
vim.opt.smartindent = true

-- Copy indent from current line when starting new line
vim.opt.autoindent = true

-- Prevent line wrapping
vim.opt.breakindent = true

-- Disable text wrap
vim.opt.wrap = true

-- Speeds up plugin wait time
vim.opt.updatetime = 50

-- Persistant undo file history
vim.opt.undofile = true

-- Enable line numbers
vim.opt.nu = true

-- Enable relative line numbers
vim.opt.rnu = true

-- Disable showing the mode below the statusline
vim.opt.showmode = false

-- Better completion experience
vim.opt.completeopt = { "menuone", "noselect" }

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Faster scrolling
vim.opt.lazyredraw = true

-- Enable highlighting search in progress
vim.opt.incsearch = true

-- Ignore case for searches
vim.opt.ignorecase = true

-- Enable case-sensitive search when uppercase letter present
vim.opt.smartcase = true

-- diagnosic inline
vim.diagnostic.config({ virtual_text = true })

vim.opt.spelllang = "en_us"
vim.opt.spell = true
