return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua", "c", "python", "typescript", "rust",
					"javascript", "go", "bash",
				},

				sync_install = false,

				auto_install = true,

				indent = {
					enable = true
				},
			})
		end
	}
}

