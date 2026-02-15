return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = { -- Insert mode
							["<C-j>"] = require("telescope.actions").move_selection_next, -- Move down
							["<C-k>"] = require("telescope.actions").move_selection_previous, -- Move up
						},
						n = { -- Normal mode
							["<C-j>"] = require("telescope.actions").move_selection_next, -- Move down
							["<C-k>"] = require("telescope.actions").move_selection_previous, -- Move up
						},
					},
					file_ignore_patterns = {
						"node_modules/.*",
                        ".git/*",
					},
				},
				pickers = {
					find_files = {
						theme = "ivy",
                        hidden = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_ivy({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			-- vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
