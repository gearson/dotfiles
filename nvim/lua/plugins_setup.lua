local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	-- themes
	{
		"dracula/vim",
		name = "dracula",
		lazy = false,
		priority = 1000,
	},
    { "catppuccin/nvim", name = "catppuccin" },
	-- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},
	"nvim-treesitter/playground",
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" } },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},
	"nvim-telescope/telescope-file-browser.nvim",

	{ "numToStr/Comment.nvim", opts = {} },
	{ "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" },

	--Buffer navigation
	{ -- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"jmcantrell/vim-virtualenv",
	"nvim-tree/nvim-web-devicons",
	"ryanoasis/vim-devicons",
	-- parentheses and stuff
	"jiangmiao/auto-pairs",
	"alvan/vim-closetag",
	"tpope/vim-surround",
	"mechatroner/rainbow_csv",
	"lukas-reineke/indent-blankline.nvim",
	"Vimjas/vim-python-pep8-indent",
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	"mhinz/vim-signify",

	-- language server
	-- "nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-context",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"jose-elias-alvarez/null-ls.nvim",
	"onsails/lspkind.nvim",  -- adds vscode-like pictograms to neovim built-in lsp
	-- "psf/black",
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- debugging

	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"jay-babu/mason-nvim-dap.nvim",
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",
	"mfussenegger/nvim-dap-python",
	-- misc
	"tpope/vim-fugitive",
	-- "scrooloose/nerdtree",
	"ellisonleao/glow.nvim",
	"mbbill/undotree",
	"jpalardy/vim-slime",
})
