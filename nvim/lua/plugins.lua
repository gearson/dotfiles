local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

vim.api.nvim_exec(
	[[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
	false
)

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	-- themes
	use({ "dracula/vim", as = "dracula" }) -- theme
	--nerdtree stuff
	use({ "scrooloose/nerdtree" })
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
	-- airline
	use({ "vim-airline/vim-airline" })
	use({ "vim-airline/vim-airline-themes" })
	use({ "jmcantrell/vim-virtualenv" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "ryanoasis/vim-devicons" })
	-- parentheses and stuff
	use({ "jiangmiao/auto-pairs" })
	use({ "alvan/vim-closetag" })
	use({ "tpope/vim-surround" })
	use({ "mechatroner/rainbow_csv" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "Vimjas/vim-python-pep8-indent" })

	use({ "tpope/vim-fugitive" })
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use({ "mhinz/vim-signify" })
	use({ "voldikss/vim-floaterm" })
	use({ "jpalardy/vim-slime" })

	-- language server
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/nvim-treesitter-context" })
	use({ "psf/black" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "neovim/nvim-lspconfig" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	-- telescope
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- misc
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	use({ "ellisonleao/glow.nvim" })
	use({ "mbbill/undotree" })
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
