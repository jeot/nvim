local function config()
	local actions = require("telescope.actions")

	require("telescope").setup({
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
		defaults = {
			layout_strategy = "horizontal",
			-- layout_config = { height = 0.95, width = 0.95 },
			layout_config = { height = 999, width = 999 },
			preview = {
				preview_cutoff = 25,
				preview_width = 0.5,
				filesize_limit = 0.1, -- MB
			},
			mappings = {
				i = {
					["<C-k>"] = actions.move_selection_previous, -- move to prev result
					["<C-j>"] = actions.move_selection_next, -- move to next result
					["<C-q>"] = actions.send_selected_to_loclist + actions.open_loclist, -- send selected to quickfixlist
					["<C-l>"] = actions.send_to_loclist + actions.open_loclist, -- send selected to quickfixlist
				},
				n = {
					["<C-;>"] = actions.close,
					["<C-q>"] = actions.send_selected_to_loclist + actions.open_loclist, -- send selected to quickfixlist
				},
			},
		},
		pickers = {
			buffers = {
				show_all_buffers = true,
				sort_mru = true,
				mappings = {
					i = {
						["<c-x>"] = "delete_buffer",
					},
				},
			},
		},
	})

	-- Enable telescope extensions, if they are installed
	pcall(require("telescope").load_extension, "fzf")
	pcall(require("telescope").load_extension, "ui-select")

	-- set keymaps
	-- See `:help telescope.builtin`
	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>i", builtin.find_files, { desc = "Find Files" })
	vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Find Buffers" })
	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
	vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
	-- vim.keymap.set('n', '<leader>fi', builtin.find_files, { desc = 'Find Files' })
	vim.keymap.set("n", "<leader>ff", builtin.builtin, { desc = "Find Everyting in Telescope" })
	-- vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find Git Files' })
	vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Current word" })
	vim.keymap.set("n", "<leader>fW", function()
		builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
	end, { desc = "Find Current Word" })
	vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Live Grep" })
	vim.keymap.set("n", "<leader>gl", builtin.live_grep, { desc = "Live Grep" })
	vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
	-- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
	-- vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
	-- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

	vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Find Colorscheme" })
	vim.keymap.set("n", "<leader>fa", function()
		builtin.find_files({ no_ignore = true, no_ignore_parent = true, hidden = true })
	end, { desc = "Find All Files" })
	vim.keymap.set("n", "<leader>fn", function()
		builtin.find_files({ search_file = vim.fn.expand("<cword>") })
	end, {})

	vim.keymap.set("n", "<leader>gs", function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end, {})
	vim.keymap.set("n", "<leader>gn", function()
		builtin.grep_string({ search = vim.fn.expand("<cword>") })
	end, {})
	vim.keymap.set("n", "<leader>gN", function()
		builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
	end, {})

	-- Slightly advanced example of overriding default behavior and theme
	vim.keymap.set("n", "<leader>/", function()
		-- You can pass additional configuration to telescope to change theme, layout, etc.
		builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			winblend = 10,
			previewer = false,
		}))
	end, { desc = "[/] Fuzzily search in current buffer" })

	-- Shortcut for searching your neovim configuration files (or other directories)
	vim.keymap.set("n", "<leader>oo", function()
		builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "Find Neovim Config Files" })

	vim.keymap.set("n", "<leader>od", function()
		builtin.find_files({ cwd = "~/Dropbox/" })
	end, { desc = "Find Files in Dropbox" })
end

return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for install instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires special font.
		--  If you already have a Nerd Font, or terminal set up with fallback fonts
		--  you can enable this
		-- { "nvim-tree/nvim-web-devicons" },
		{ "echasnovski/mini.icons" },
	},
	config = config,
}
