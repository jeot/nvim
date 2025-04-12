-- tree-sitter and context for neovim
return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.install").compilers = { "gcc" }
			require("nvim-treesitter.configs").setup({
				build = ":TSUpdate",
				event = { "BufReadPre", "BufNewFile" },
				ensure_installed = {
					"c",
					"cpp",
					"matlab",
					"python",
					"c_sharp",
					"lua",
					"html",
					"make",
					"markdown",
					"rust",
				},
				ignore_install = {},
				incremental_selection = {
					enable = true,
					disable = function(lang, bufnr) -- Disable in large files
						return lang == "vim" or vim.api.nvim_buf_line_count(bufnr) > 5000
					end,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<C-bs>",
					},
				},
				sync_install = false,
				auto_install = false,
				highlight = {
					enable = true,
					disable = { "txt", "help" },
				},
				indent = {
					enable = true,
				},
			})
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	},

	-- { 'nvim-treesitter/nvim-treesitter-context' } ,
}
