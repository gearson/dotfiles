-- todo comments
require("todo-comments").setup()

-- vim-slime settings
vim.g["slime_target"] = "tmux"
vim.g["slime_pase_file"] = "$Home/.slime_pase"
vim.g["slime_python_ipython"] = 1
vim.cmd([[let g:slime_default_config = {'socket_name': 'default', 'target_pane': '{last}'} ]])
