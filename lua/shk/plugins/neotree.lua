local function keymaps()
	vim.keymap.set("n", "<leader>fe", "<cmd>Neotree toggle filesystem left<CR>", {})
	-- vim.keymap.set('n', '<leader>fd', ":Neotree float reveal_file=<cfile> reveal_force_cwd<cr>")
	vim.keymap.set("n", "<leader>fb", ":Neotree toggle show buffers right<cr>")
	-- vim.keymap.set('n', '<leader>/', ":Neotree toggle current reveal_force_cwd<cr>")
	-- vim.keymap.set('n', '<leader>|', ":Neotree reveal<cr>")
	vim.keymap.set("n", "<leader>fg", ":Neotree float git_status left<cr>")
end
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		-- global keymaps
		keymaps()
		-- inside neotree
		require("neo-tree").setup({
			source_selector = {
				winbar = true,
				statusline = false,
			},
			window = {
				position = "left",
				width = 30,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["O"] = function(state)
						local node = state.tree:get_node()
						if require("neo-tree.utils").is_expandable(node) then
							state.commands["toggle_node"](state)
						else
							state.commands["open"](state)
							vim.cmd("Neotree reveal")
							vim.cmd("norm j")
							-- vim.cmd('Neotree float toggle reveal_force_cwd dir=' .. vim.fn.getcwd()) -- I use this one.
						end
					end,
					["/"] = "noop",
					["o"] = { "open", nowait = true },
					["oc"] = "noop",
					["od"] = "noop",
					["og"] = "noop",
					["om"] = "noop",
					["on"] = "noop",
					["os"] = "noop",
					["ot"] = "noop",
					-- ['o'] = { "open", nowait = true },
					["<c-p>"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
					["h"] = { "close_node", nowait = true },
					["l"] = { "open", nowait = true },
					["f"] = { "fuzzy_finder", nowait = true },
					["s"] = { "filter_on_submit", nowait = true },
					["v"] = { "system_open", nowait = true },
					["E"] = { "system_explorer", nowait = true },
					-- ['E'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
					-- ['B'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
					-- ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
				},
			},
			commands = {
				system_explorer = function(state)
					local node = state.tree:get_node()
					local path = node.path
					-- print(path)
					vim.api.nvim_exec("call jobstart('Explorer.exe .')", true)
				end,
				system_open = function(state)
					local node = state.tree:get_node()
					local path = node.path
					-- macOs: open file in default application in the background.
					-- vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
					-- Linux: open file in default application
					-- vim.fn.jobstart({ "xdg-open", path }, { detach = true })
					-- Windows: open file in default application
					print(path)
					vim.fn.jobstart(path, { detach = true })
				end,
			},
		})
	end,
}
