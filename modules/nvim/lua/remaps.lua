vim.g.mapleader = " "


-- Leader key remap to open :Ex (file explorer)
vim.api.nvim_set_keymap('n', '<leader>e', ':Ex<CR>', { noremap = true, silent = true })

-- Copy to clipboard with <space>y
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- Paste from clipboard with <space>p
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })



-- Copy entire file to clipboard with <leader>ay
vim.api.nvim_set_keymap('n', '<leader>ay', ':w !xclip -selection clipboard<CR>', { noremap = true, silent = true })

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap('n', '<C-c>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '<Esc>', { noremap = true, silent = true })

-- capital w save
vim.api.nvim_create_user_command('W', 'wa', {});

-- Latex compile
vim.api.nvim_create_user_command('Wl', 'wa | !bash ~/.config/scripts/latex_compile.sh', {})
vim.api.nvim_create_user_command('WL', 'wa | !bash ~/.config/scripts/latex_compile.sh', {})
