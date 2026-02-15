vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set spell!")

vim.opt.smartindent = true

vim.opt.scrolloff = 8

-- netrw settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.wo.relativenumber = true
    vim.wo.number = true
  end,
})
vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 1



