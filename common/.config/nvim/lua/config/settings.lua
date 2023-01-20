vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- TODO: figure those out later
-- vim.opt.swapfile = false
-- vim.opt.backup = false

-- vim.opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undodir"
-- vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

-- Change cursor shape to beam on exit
vim.cmd "aug Shape | au VimLeave,VimSuspend * set guicursor=a:ver90 | aug END"
