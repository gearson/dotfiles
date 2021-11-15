local o = vim.o

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'
vim.opt.mouse = vim.opt.mouse + 'a'
o.guicursor = 'a:blinkon400' 
vim.opt.undofile = true
o.ignorecase = true
o.smartcase = true
o.updatetime = 250
o.signcolumn = 'yes'
o.number = true
o.relativenumber = true
o.expandtab = true
o.smarttab = true
o.smartindent = true
o.wrap = true
o.tabstop = 4
o.softtabstop = 5
o.shiftwidth = 4
o.list = true
vim.cmd('set listchars=tab:►/,trail:•')
o.hidden = true
o.swapfile = false
o.scrolloff = 8
o.colorcolumn = '80'
o.cursorline = true
o.smartcase = true
o.undofile = true
o.backup = false
o.encoding = 'utf-8'
o.hlsearch = false
o.cmdheight = 1

-- highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

--Set colorscheme (order is important here)

o.background = 'dark'
vim.cmd('let $NVIM_TUI_ENABLE_TRUE_COLOR=1')
o.termguicolors = true

vim.cmd [[colorscheme dracula]]
vim.g["dracula_colorterm"] = 0
vim.g["dracula_italic"] = 0
vim.cmd[[au VimEnter * highlight ColorColumn guibg=#44475a gui=NONE]]
vim.cmd[[au VimEnter * highlight CursorLineNr guifg=#ff79c6 gui=NONE]]

-- airline settings
vim.g["airline_powerline_fonts"] = 0
vim.g["airline_theme"] = 'dracula'
vim.g["airline#extensions#whitespace#enabled"] = 0
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#buffer_nr_show"] = 0
vim.g["airline#extensions#tabline#fnamemod"] = ':t'
vim.g["airline_powerline_fonts"] = 1


-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}


-- Coc Settiings

vim.cmd("let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-pyright', 'coc-snippets', 'coc-prettier']")
vim.cmd("source ~/dotfiles/nvim/lua/coc-completion.vim")

-- Telescope Settings
-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

