-- misc
vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', {noremap = true, silent = false})

-- move single lines
vim.api.nvim_set_keymap('n', '<C-j>', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':m .-2<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-j>', '<ESC>:m .+1<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<ESC>:m .-2<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-j>', ":m '>+1<CR>gv==gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-k>', ":m '<-2<CR>gv==gv", {noremap = true, silent = true})

-- split navigation in vim
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', {noremap = true, silent = true})
-- switch buffers
vim.api.nvim_set_keymap('n', '<C-Left>', ':bprev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', ':bnext<CR>', {noremap = true, silent = true})

-- NERDtree
vim.api.nvim_set_keymap('n', '<C-b>', ':NERDTreeToggle<CR>', {silent = true})


-- Coc bindings
vim.api.nvim_set_keymap('n', '<leader>f', ":call CocAction('format')<CR>", {silent = false})
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {noremap = false, silent = false})
