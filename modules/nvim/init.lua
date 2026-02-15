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

require("editor_config")
require("remaps")

-- local ls = require"luasnip"
-- require("luasnip.loaders.from_lua").load({
-- 	paths = "~/config/nvim/snippets/",
-- })
--
require("lazy").setup("plugins")
