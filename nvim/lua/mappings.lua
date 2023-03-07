-- close current buffer
vim.keymap.set("n", "<leader>q", ":bd<CR>", { noremap = true, silent = false })
-- save current buffer
vim.keymap.set("n", "<leader>s", ":w<CR>", { noremap = true, silent = false })
-- makes ctrl-DEL behave like everywhere else. Deletes word forward
vim.keymap.set("i", "<C-Del>", "<C-o>de", { noremap = true, silent = true })
-- backspace to delete stuff in normal mode
vim.keymap.set("n", "<BS>", "X", { noremap = true, silent = true })
-- paste last yank (relevant if you dd a line and don't want to paste that one)
vim.keymap.set("n", "<leader>p", '"0p"', { noremap = true, silent = true })
-- center when ctrl-d and ctrl u
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- move single lines
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<ESC>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<ESC>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- move text blocks in visual mode up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", { noremap = true, silent = true })

-- split navigation in vim with ctrl-arrow keys
vim.keymap.set("n", "<C-Left>", "<C-W><C-H>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "<C-W><C-L>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "<C-W><C-J>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Up>", "<C-W><C-K>", { noremap = true, silent = true })
-- switch buffers
vim.keymap.set("n", "<C-H>", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-L>", ":bnext<CR>", { noremap = true, silent = true })

-- Telescope mappings
vim.keymap.set("n", "<leader>sb", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[S]earch Fuzzily in current [B]uffer" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>sc", require("telescope.builtin").commands, { desc = "[S]earch [C]ommands" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<C-P>", require("telescope.builtin").git_files, { desc = "Search Git Files" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sp", require("telescope.builtin").live_grep, { desc = "[S]earch by [P]attern" })

vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "[G]it [S]tatus" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })

vim.keymap.set(
	"n",
	"<C-F>",
	[[<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt=top<CR>]],
	{ desc = "Fuzzy search the current buffer" }
)

-- diagnostics mappings
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "LspSaga hover doc" })

-- NERDtree
vim.keymap.set("n", "<C-b>", ":NERDTreeToggle<CR>", { silent = true })

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Floaterm toggle
vim.keymap.set("n", "<F12>", ":FloatermToggle<CR>", { silent = true })
vim.keymap.set("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", { silent = true })

-- vim slime
vim.keymap.set("n", "<C-c><C-s>", ":SlimeSendCurrentLine<CR>", { silent = true })

-- comment.nvim remap to ctrl+/
vim.keymap.set("n", "<C-_>", "gcc", { remap = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true })
