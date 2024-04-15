local function config()

	local telescope = require('telescope')
	local builtin = require('telescope.builtin')
	local actions = require('telescope.actions')

	telescope.setup {
		defaults = {
			mappings = {
				i = {
					["<C-k>"] = actions.move_selection_previous,           -- move to prev result
					["<C-j>"] = actions.move_selection_next,               -- move to next result
					["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
				},
				n = {
					["<C-;>"] = actions.close,
					["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
				}
			},
		},
		pickers = {
			buffers = {
				show_all_buffers = true, sort_mru = true,
				mappings = {
					i = {
						["<c-x>"] = "delete_buffer",
					},
				},
			},
		},
	}

	-- set keymaps
	vim.keymap.set('n', '<leader>b', builtin.buffers, {})
	vim.keymap.set('n', '<leader>i', function() builtin.find_files() end, {})
	vim.keymap.set('n', '<leader>fi', function() builtin.find_files() end, {})
	vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	vim.keymap.set('n', '<leader>fa', function() builtin.find_files({ no_ignore = true, no_ignore_parent = true, hidden = true, }) end, {})
	vim.keymap.set('n', '<leader>fn', function() builtin.find_files({search_file=vim.fn.expand("<cword>")}) end, {})
	-- vim.keymap.set('n', '<leader>fw', function() builtin.find_files({search_file=vim.fn.expand('<cword>')}) end, {})
	-- vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ no_ignore = true }) end, {})
	vim.keymap.set('n', '<leader>gl', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>gs', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, {})
	vim.keymap.set('n', '<leader>gn', function() builtin.grep_string({ search = vim.fn.expand("<cword>") }) end, {})
	vim.keymap.set('n', '<leader>gN', function() builtin.grep_string({ search = vim.fn.expand("<cWORD>") }) end, {})
	vim.keymap.set('n', '<leader>fs', function()
		builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
			winblend = 0,
			previewer = false,
		})
	end, { desc = '[/] Fuzzily search in current buffer' })

	vim.keymap.set('n', '<leader>oo', function() builtin.find_files({ cwd = vim.fn.stdpath 'config' }) end, {})

end

return {
	"nvim-telescope/telescope.nvim",
	config = config,
}
