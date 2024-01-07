	-- git integration
return  {

	{  'tpope/vim-fugitive',
		config = function()
			vim.keymap.set('n', '<leader>gg', vim.cmd.Git)
		end,
	},
	{ 'lewis6991/gitsigns.nvim' , config = true },

}
