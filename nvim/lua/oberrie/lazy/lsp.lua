return {
        {
                "williamboman/mason.nvim",
                build = ":MasonUpdate",
                config = function()
                        require("mason").setup()
                end,
        },
        {
                "williamboman/mason-lspconfig.nvim",
                config = function()
                        require("mason-lspconfig").setup({
                                ensure_installed = {
                                        "clangd",
                                },
                                automatic_installation = true,
                        })
                end,
        },
        {
                "neovim/nvim-lspconfig",
                config = function()
                        local lspconfig = require("lspconfig")
                        local servers = require("mason-lspconfig").get_installed_servers()
                        local exclude = {
                                kotlin_lsp = true,
                        }
                        for _, server in ipairs(servers) do
                                if not exclude[server] then
                                        lspconfig[server].setup({})
                                end
                        end
                end,
        },
}
