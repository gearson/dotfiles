-- misc
-- close current buffer
vim.api.nvim_set_keymap("n", "<leader>q", ":bd<CR>", { noremap = true, silent = false })
-- save current buffer
vim.api.nvim_set_keymap("n", "<leader>s", ":w<CR>", { noremap = true, silent = false })
-- makes ctrl-DEL behave like everywhere else. Deletes word forward
vim.api.nvim_set_keymap("i", "<C-Del>", "<C-o>de", { noremap = true, silent = true })
-- backspace to delete stuff in normal mode
vim.api.nvim_set_keymap("n", "<BS>", "X", { noremap = true, silent = true })
-- paste last yank (relevant if you dd a line and don't want to paste that one)
vim.api.nvim_set_keymap("n", "<leader>p", '"0p"', { noremap = true, silent = true })
-- center when ctrl-d and ctrl u
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- move single lines
vim.api.nvim_set_keymap("n", "<C-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-j>", "<ESC>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<ESC>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Visual Block --
-- Move text up and down
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- split navigation in vim with ctrl-arrow keys
vim.api.nvim_set_keymap("n", "<C-Left>", "<C-W><C-H>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Right>", "<C-W><C-L>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Down>", "<C-W><C-J>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-Up>", "<C-W><C-K>", { noremap = true, silent = true })
-- switch buffers
vim.api.nvim_set_keymap("n", "<C-H>", ":bprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-L>", ":bnext<CR>", { noremap = true, silent = true })

-- NERDtree
vim.api.nvim_set_keymap("n", "<C-b>", ":NERDTreeToggle<CR>", { silent = true })

-- Floaterm toggle
vim.api.nvim_set_keymap("n", "<F12>", ":FloatermToggle<CR>", { silent = true })
vim.api.nvim_set_keymap("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", { silent = true })

-- Telescope mappings
vim.api.nvim_set_keymap(
	"n",
	"<leader><space>",
	[[<cmd>lua require('telescope.builtin').buffers()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sc",
	[[<cmd>lua require('telescope.builtin').commands()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<C-P>",
	[[<cmd>lua require('telescope.builtin').find_files({hidden=true, file_ignore_patterns = {".git/*"}})<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sd",
	[[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
	{ noremap = true, silent = true }
) -- grep on word under cursor!
vim.api.nvim_set_keymap(
	"n",
	"<leader>sp",
	[[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sb",
	[[<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt=top<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>?",
	[[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sh",
	[[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
	{ noremap = true, silent = true }
)

-- diagnostics mappings
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- vim slime
vim.api.nvim_set_keymap("n", "<C-c><C-s>", ":SlimeSendCurrentLine<CR>", { silent = true })

-- comment.nvim remap to ctrl+/
vim.keymap.set("n", "<C-_>", "gcc", { remap = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true })
