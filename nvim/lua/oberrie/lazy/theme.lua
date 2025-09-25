return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,   -- load before other plugins
    lazy = false,      -- load immediately
    config = function()
        vim.o.background = "dark" -- or "light"
        require("gruvbox").setup({
            contrast = "hard",    -- can be "soft", "medium", or "hard"
            italic = {
                strings = false,
                comments = true,
                operators = false,
                folds = true,
            },
            overrides = {},
            transparent_mode = true,
        })

        vim.cmd.colorscheme("gruvbox")
    end,
}

