local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
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

return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}
    -- themes
    use {'dracula/vim', as = 'dracula'} -- theme
    --nerdtree stuff
    use {'scrooloose/nerdtree'}
    use {'scrooloose/nerdcommenter'}
    -- airline
    use {'vim-airline/vim-airline'}
    use {'vim-airline/vim-airline-themes'}
    use {'kyazdani42/nvim-web-devicons'}
    -- parentheses and stuff
    use {'jiangmiao/auto-pairs'}
    use {'alvan/vim-closetag'}
    use {'tpope/vim-surround'}
    use {'lukas-reineke/indent-blankline.nvim'}
    
    use{'tpope/vim-fugitive'}
    use{'voldikss/vim-floaterm'}
    -- language server
    use {'neoclide/coc.nvim', branch='release'} -- run :CocInstall coc-pyright
    use {'nvim-treesitter/nvim-treesitter'}
    --use {'neovim/nvim-lspconfig'}
    --use {'hrsh7th/cmp-nvim-lsp'}
    --use {'hrsh7th/nvim-cmp'}

    -- telescope
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
