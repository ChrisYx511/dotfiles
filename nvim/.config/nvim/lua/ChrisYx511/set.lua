vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.smarttab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Copilot completions flow through blink.cmp (ghost text + menu)
vim.g.ai_cmp = true
vim.opt.laststatus = 3
vim.opt.showmode = false

-- Disable netrw (replaced by mini.files)
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
