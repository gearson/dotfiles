local o = vim.o

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'
o.hidden = true
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
o.hidden = true
o.swapfile = false
o.scrolloff = 8
o.colorcolumn = '79'
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
o.termguicolors = true
vim.cmd [[colorscheme dracula]]
vim.g["dracula_colorterm"] = 0

-- airline settings
vim.g["airline_powerline_fonts"] = 0
vim.g["airline_theme"] = 'dracula'
vim.g["airline#extensions#whitespace#enabled"] = 0
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g["airline#extensions#tabline#buffer_nr_show"] = 0


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

vim.cmd("let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-pyright', 'coc-snippets']")


vim.cmd("let g:coc_snippet_next= '<tab>'")
--o.completeopt='menu,menuone,noselect'

--require'lspconfig'.pyright.setup{}

 -- Setup nvim-cmp--[[.]]
  --[[local cmp = require'cmp']]

  --[[cmp.setup({]]
    --[[snippet = {]]
      --[[-- REQUIRED - you must specify a snippet engine]]
      --[[expand = function(args)]]
        --[[vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.]]
        --[[-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.]]
        --[[-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.]]
        --[[-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.]]
      --[[end,]]
    --[[},]]
    --[[mapping = {]]
      --[[['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),]]
      --[[['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),]]
      --[[['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),]]
      --[[['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.]]
      --[[['<C-e>'] = cmp.mapping({]]
        --[[i = cmp.mapping.abort(),]]
        --[[c = cmp.mapping.close(),]]
      --[[}),]]
      --[[['<CR>'] = cmp.mapping.confirm({ select = true }),]]
    --[[},]]
    --[[sources = cmp.config.sources({]]
      --[[{ name = 'nvim_lsp' },]]
      --[[{ name = 'vsnip' }, -- For vsnip users.]]
      --[[-- { name = 'luasnip' }, -- For luasnip users.]]
      --[[-- { name = 'ultisnips' }, -- For ultisnips users.]]
      --[[-- { name = 'snippy' }, -- For snippy users.]]
    --[[}, {]]
      --[[{ name = 'buffer' },]]
    --[[})]]
  --[[})]]

  --[[-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).]]
  --[[cmp.setup.cmdline('/', {]]
    --[[sources = {]]
      --[[{ name = 'buffer' }]]
    --[[}]]
  --[[})]]

  --[[-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).]]
  --[[cmp.setup.cmdline(':', {]]
    --[[sources = cmp.config.sources({]]
      --[[{ name = 'path' }]]
    --[[}, {]]
      --[[{ name = 'cmdline' }]]
    --[[})]]
  --[[})]]

  --[[-- Setup lspconfig.]]
  --[[local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())]]
  --[[-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.]]
  --[[require('lspconfig')['pyright'].setup {]]
    --[[capabilities = capabilities]]
  --[[}]]
