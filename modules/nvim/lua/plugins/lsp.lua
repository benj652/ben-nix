return {
    -- {
    --     "williamboman/mason.nvim",
    --     lazy = false,
    --     config = function()
    --         require("mason").setup()
    --     end,
    -- },
    -- {
    --     "williamboman/mason-lspconfig.nvim",
    --     lazy = false,
    --     opts = {
    --         auto_install = true,
    --     },
    -- },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

           local servers = {
                "tsserver",
                "lua_ls",
                "bashls",
                "texlab",
                "jdtls",
                "gopls",
                "clangd",
                "html",
                "cssls",
                "tailwindcss",
            }

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                })
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        -- Show LSP error on hover with 'K' key
            vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
            vim.diagnostic.config({
                signs = false,
                virtual_text = true
            })
        end,
    },
}
