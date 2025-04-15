return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		keymaps = {
			["<BS>"] = { "actions.parent", mode = "n" },
			["<Esc>"] = { "actions.close", mode = "n" },
			["q"] = { "actions.close", mode = "n" },
			["<leader>q"] = { "actions.close", mode = "n" },
			["<leader>wq"] = { "actions.close", mode = "n" },
			["<leader>cw"] = { "actions.close", opts = { exit_if_last_buf = false }, mode = "n" },
			["S"] = { "actions.open_external", mode = "n" },
			["R"] = { "actions.refresh", mode = "n" },
			["<C-d>"] = { "actions.preview_scroll_down", mode = "n" },
			["<C-u>"] = { "actions.preview_scroll_up", mode = "n" },
		},
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons" } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
}
