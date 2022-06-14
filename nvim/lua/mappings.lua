-- misc
vim.api.nvim_set_keymap('n', '<leader>q', ':bd<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', {noremap = true, silent = false})

vim.api.nvim_set_keymap('i', '<C-Del>', '<C-o>de', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<BS>', 'X', {noremap = true, silent = true})

-- move single lines
vim.api.nvim_set_keymap('n', '<C-j>', ':m .+1<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':m .-2<CR>==', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-j>', '<ESC>:m .+1<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<ESC>:m .-2<CR>==gi', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-j>', ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-k>', ":m '<-2<CR>gv=gv", {noremap = true, silent = true})

-- split navigation in vim
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-W><C-H>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-W><C-L>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-W><C-J>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-W><C-K>', {noremap = true, silent = true})
-- switch buffers
vim.api.nvim_set_keymap('n', '<C-H>', ':bprev<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-L>', ':bnext<CR>', {noremap = true, silent = true})

-- NERDtree
vim.api.nvim_set_keymap('n', '<C-b>', ':NERDTreeToggle<CR>', {silent = true})


-- Coc bindings
-- vim.api.nvim_set_keymap('n', '<leader>w', ":call CocAction('format')<CR> :w <CR>", {silent = false})
-- vim.api.nvim_set_keymap('n', '<leader>f', ":call CocAction('format')<CR>", {silent = false})
-- vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {noremap = false, silent = false})
-- vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {noremap = false, silent = false})
-- vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {noremap = false, silent = false})
-- vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {noremap = false, silent = false})
-- vim.api.nvim_set_keymap('n', '<F2>', '<Plug>(coc-rename)', {noremap = false, silent = false})


-- Floaterm toggle
vim.api.nvim_set_keymap('n', '<F12>', ':FloatermToggle<CR>', {silent = true})
vim.api.nvim_set_keymap('t', '<F12>', '<C-\\><C-n>:FloatermToggle<CR>', {silent = true})

-- Telescope mappings
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>se', [[<cmd>lua require('telescope.builtin').file_browser({hidden = true})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sc', [[<cmd>lua require('telescope.builtin').commands()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-P>', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-P>', [[<cmd>lua require('telescope.builtin').find_files({hidden=true, previewer = false, file_ignore_patterns = {".git/*"}})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

-- vim slime
vim.api.nvim_set_keymap('n', '<C-c><C-s>', ':SlimeSendCurrentLine<CR>', {silent = true})
