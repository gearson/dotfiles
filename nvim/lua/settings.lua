local opt = vim.opt

-- Makes neovim and host OS clipboard play nicely with each other
opt.clipboard = "unnamedplus"
opt.mouse = vim.opt.mouse + "a"
opt.guicursor = "a:blinkon400"
opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

opt.number = true
opt.relativenumber = true
opt.wrap = true
opt.linebreak = true
opt.breakindent = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true

opt.list = true
vim.cmd("set listchars=tab:►/,trail:•")
opt.hidden = true
opt.cursorline = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "80"

opt.encoding = "utf-8"
opt.cmdheight = 1
opt.splitbelow = true
opt.splitright = true
opt.diffopt = "vertical"
opt.laststatus = 3

-- Decrease update time
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

opt.termguicolors = true
vim.g.netrw_fastbrowse = 0

-- highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

vim.g.python3_host_prog = "/home/adm_dohmen/.pyenv/versions/py3nvim/bin/python"
