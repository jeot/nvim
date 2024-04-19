-- git integration

return  {

	{
		'tpope/vim-fugitive',
		config = function()
			vim.keymap.set('n', '<leader>gg', vim.cmd.Git)
		end,
	},

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	-- { 'lewis6991/gitsigns.nvim' , opts = {} },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

}
