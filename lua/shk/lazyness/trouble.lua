local settings_without_icons = {
	icons = false,
	fold_open = "",
	fold_closed = "",
	indent_lines = false,
	signs = {
		error = "error",
		warning = "warn",
		hint = "hint",
		information = "info"
	},
	use_diagnostic_signs = false,
	auto_open = false,
	auto_close = true,
}

return {
	"folke/trouble.nvim",
	branch = "dev", -- IMPORTANT!
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
	},
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
	-- config = function()
	-- 	require 'trouble'.setup(settings_without_icons)
	-- 	-- vim.keymap.set('n', '<leader>tt', ":TroubleToggle workspace_diagnostics<CR>", {})
	-- 	-- vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle() end)
	-- 	vim.keymap.set("n", "<leader>tt", function() require("trouble").toggle("workspace_diagnostics") end)
	-- 	-- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
	-- 	-- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
	-- 	-- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
	-- 	vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
	-- 	vim.keymap.set("n", "<c-0>", function() require("trouble").next({ skip_groups = true, jump = true }); end)
	-- 	vim.keymap.set("n", "<c-9>",
	-- 		function() require("trouble").previous({ skip_groups = true, jump = true }); end)
	-- 	vim.keymap.set("n", ")", function() require("trouble").next({ skip_groups = true, jump = true }); end)
	-- 	vim.keymap.set("n", "(", function() require("trouble").previous({ skip_groups = true, jump = true }); end)
	-- 	-- vim.keymap.set("n", "", function() require("trouble").first({ skip_groups = true, jump = true }); end)
	-- 	-- vim.keymap.set("n", "", function() require("trouble").last({ skip_groups = true, jump = true }); end)
	-- end,
}
