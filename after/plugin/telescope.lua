local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
})


vim.keymap.set('n', '<leader>fi', function() builtin.find_files() end, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({no_ignore=true}) end, {})
vim.keymap.set('n', '<leader>fa', function() builtin.find_files({no_ignore=true, no_ignore_parent=true, hidden=true, }) end, {})
-- vim.keymap.set('n', '<leader>fw', function() builtin.find_files({search_file=vim.fn.expand('<cword>')}) end, {})
vim.keymap.set('n', '<leader>fw', '<cmd>lua require("telescope.builtin").find_files({search_file=vim.fn.expand("<cword>")})<cr>') -- find file under cursor
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gs', function() builtin.grep_string({search=vim.fn.input("Grep > ")}) end, {})

