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
        -- lazy = false,
        -- priority = 1000,
},	
	"scrooloose/nerdtree",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{ "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" },
	-- airline
	"vim-airline/vim-airline",
	"vim-airline/vim-airline-themes",
	"jmcantrell/vim-virtualenv",
	"kyazdani42/nvim-web-devicons",
	"ryanoasis/vim-devicons",
	-- parentheses and stuff
	"jiangmiao/auto-pairs",
	"alvan/vim-closetag",
	"tpope/vim-surround",
	"mechatroner/rainbow_csv",
	"lukas-reineke/indent-blankline.nvim",
	"Vimjas/vim-python-pep8-indent",

	"tpope/vim-fugitive",
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	"mhinz/vim-signify",
	-- "voldikss/vim-floaterm",
	"jpalardy/vim-slime",

	-- language server
    { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
	-- "nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-context",
	"psf/black",
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
	"onsails/lspkind.nvim",
	-- telescope
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	"nvim-telescope/telescope-file-browser.nvim",

	-- misc
	"ellisonleao/glow.nvim",
	"mbbill/undotree",
})
