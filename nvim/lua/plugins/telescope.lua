require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})
-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

require("telescope").load_extension("file_browser")
