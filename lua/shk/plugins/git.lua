-- git integration

return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			-- "ibhagwan/fzf-lua", -- optional
			-- "echasnovski/mini.pick", -- optional
		},
		-- config = true,
		config = function()
			require("neogit").setup({
				integrations = {
					diffview = true,
					signs = true,
					status = true,
				},
				mappings = {
					-- Example: Change status keybinding to <leader>gs
					-- status = { ["<leader>gs"] = "PushPopup" },
					push = { ["<leader>gp"] = "push" },
				},
			})
			-- local neogit = require("neogit")
			vim.keymap.set("n", "<leader>ng", require("neogit").open, {})
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			vim.keymap.set("n", "<leader>dd", function()
				local lib = require("diffview.lib")
				local view = lib.get_current_view()
				if view then
					-- Current tabpage is a Diffview; close it
					vim.cmd.DiffviewClose()
				else
					-- No open Diffview exists: open a new one
					vim.cmd.DiffviewOpen()
				end
			end, {})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				-- Actions
				-- map('n', '<leader>hs', gitsigns.stage_hunk)
				-- map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
				map("n", "<leader>hr", gitsigns.reset_hunk)
				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				-- map('n', '<leader>hS', gitsigns.stage_buffer)
				-- map('n', '<leader>hu', gitsigns.undo_stage_hunk)
				-- map('n', '<leader>hR', gitsigns.reset_buffer)
				map("n", "<leader>hp", gitsigns.preview_hunk)
				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end)
				-- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
				map("n", "<leader>hd", gitsigns.diffthis)
				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end)
				-- map('n', '<leader>td', gitsigns.toggle_deleted)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},
}

-- the old stuff
--[[
return {

	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
			vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiff)
		end,
	},

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	-- { 'lewis6991/gitsigns.nvim' , opts = {} },
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				-- Actions
				-- map('n', '<leader>hs', gitsigns.stage_hunk)
				-- map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
				map("n", "<leader>hr", gitsigns.reset_hunk)
				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				-- map('n', '<leader>hS', gitsigns.stage_buffer)
				-- map('n', '<leader>hu', gitsigns.undo_stage_hunk)
				-- map('n', '<leader>hR', gitsigns.reset_buffer)
				map("n", "<leader>hp", gitsigns.preview_hunk)
				map("n", "<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end)
				-- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
				map("n", "<leader>hd", gitsigns.diffthis)
				map("n", "<leader>hD", function()
					gitsigns.diffthis("~")
				end)
				-- map('n', '<leader>td', gitsigns.toggle_deleted)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},
}
--]]
