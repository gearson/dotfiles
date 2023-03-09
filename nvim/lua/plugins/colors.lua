
--Set colorscheme (order is important here)

vim.opt.background = "dark"
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

-- vim.g["dracula_colorterm"] = 0
-- vim.g["dracula_italic"] = 0

-- dracula theme
vim.cmd([[colorscheme dracula]])
vim.cmd([[au VimEnter * highlight ColorColumn guibg=#44475a gui=NONE]])
vim.cmd([[au VimEnter * highlight CursorLineNr guifg=#ff79c6 gui=NONE guibg=none]])
vim.cmd([[au VimEnter * highlight CursorLine guibg=none gui=NONE]])
vim.cmd([[au VimEnter * highlight TelescopeBorder guifg=#bd93f9]])
vim.cmd([[au VimEnter * highlight WinSeparator guifg=#bd93f9 guibg=None]])

vim.api.nvim_set_hl(0, '@parameter.python', { fg='#ffb86c'})
vim.api.nvim_set_hl(0, '@field.python', { fg='#ffb86c'})
vim.api.nvim_set_hl(0, '@function.builtin.python', { fg='#8BE9FD'})
vim.api.nvim_set_hl(0, '@constructor.python', { fg='#8BE9FD'})
vim.api.nvim_set_hl(0, '@constant.builtin.python', { fg='#BD93F9'})


-- catppuccin theme
-- vim.cmd([[colorscheme catppuccin-frappe]])
-- vim.cmd([[au VimEnter * highlight IndentBlanklineSpaceChar guifg=#626880 gui=nocombine]])
