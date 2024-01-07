-- harpoon by the name is: ThePrimeagen
return {
	'ThePrimeagen/harpoon',
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set('n', '<leader>ha', mark.add_file)
		vim.keymap.set('n', '<leader>he', ui.toggle_quick_menu)
		vim.keymap.set('n', '<leader>hi', ui.toggle_quick_menu)
		vim.keymap.set('n', '<c-j>', function() ui.nav_file(1) end)
		vim.keymap.set('n', '<c-k>', function() ui.nav_file(2) end)
		vim.keymap.set('n', '<c-l>', function() ui.nav_file(3) end)
		--vim.keymap.set('n', '<c-;>', function() ui.nav_file(4) end)
		-- vim.keymap.set('n', ';', function() ui.nav_next() end)
		-- vim.keymap.set('n', ',', function() ui.nav_prev() end)

	end
}
