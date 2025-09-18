return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.8",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require("telescope").setup({})

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>gs", builtin.git_status)
        vim.keymap.set("n", "<leader>gc", builtin.git_commits)
        vim.keymap.set("n", "<leader>gb", builtin.git_branches)
    end
}

