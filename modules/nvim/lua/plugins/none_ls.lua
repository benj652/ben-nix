return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.erb_lint,
                -- require("none-ls.formatting.bibtex-tidy")
                -- null_ls.builtins.formatting.bibtex_tidy,
				require("none-ls.formatting.latexindent"),
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.black
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
