local function configuration()
	-- See `:help cmp`
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	luasnip.config.setup({})

	cmp.setup({
		formatting = {
			fields = { "abbr", "menu", "kind" },
			format = function(entry, item)
				-- Define menu shorthand for different completion sources.
				local menu_icon = {
					nvim_lsp = "NLSP",
					nvim_lua = "NLUA",
					luasnip = "LSNP",
					buffer = "BUFF",
					path = "PATH",
				}
				-- Set the menu "icon" to the shorthand for each completion source.
				item.menu = menu_icon[entry.source.name]

				-- Set the fixed width of the completion menu to 60 characters.
				-- fixed_width = 20

				-- Set 'fixed_width' to false if not provided.
				fixed_width = fixed_width or false

				-- Get the completion entry text shown in the completion window.
				local content = item.abbr

				-- Set the fixed completion window width.
				if fixed_width then
					vim.o.pumwidth = fixed_width
				end

				-- Get the width of the current window.
				-- local win_width = vim.api.nvim_win_get_width(0)
				local full_width = vim.o.columns

				-- Set the max content width based on either: 'fixed_width'
				-- or a percentage of the window width, in this case 20%.
				-- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
				local max_content_width = fixed_width and fixed_width - 10 or math.floor(full_width * 0.25)

				-- Truncate the completion entry text if it's longer than the
				-- max content width. We subtract 3 from the max content width
				-- to account for the "..." that will be appended to it.
				if #content > max_content_width then
					item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
				else
					item.abbr = content .. (" "):rep(max_content_width - #content)
				end
				return item
			end,
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		completion = { completeopt = "menu,menuone,noinsert" },

		mapping = cmp.mapping.preset.insert({
			-- Select the [n]ext/[p]revious item
			["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			-- scroll documentation of the completion item
			["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
			-- Accept ([y]es) the completion.
			-- ['<C-y>'] = cmp.mapping.confirm { select = true },
			["<C-y>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
			["<C-l>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),

			-- Manually trigger a completion from nvim-cmp.
			--  Generally you don't need this, because nvim-cmp will display
			--  completions whenever it has completion options available.
			-- ["<C-Space>"] = cmp.mapping.complete({}),

			-- Think of <c-l> as moving to the right of your snippet expansion.
			--  So if you have a snippet that's like:
			--  function $name($args)
			--    $body
			--  end
			--
			-- <c-l> will move you to the right of each of the expansion locations.
			-- <c-h> is similar, except moving you backwards.
			-- ["<C-l>"] = cmp.mapping(function()
			-- 	if luasnip.expand_or_locally_jumpable() then
			-- 		luasnip.expand_or_jump()
			-- 	end
			-- end, { "i", "s" }),
			-- ["<C-h>"] = cmp.mapping(function()
			-- 	if luasnip.locally_jumpable(-1) then
			-- 		luasnip.jump(-1)
			-- 	end
			-- end, { "i", "s" }),
		}),

		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "buffer" },
		},

		-- window = {
		-- 	completion = {
		-- 		-- Adjust height and width as needed
		-- 		height = 10,
		-- 		width = 50,
		-- 	},
		-- 	documentation = {
		-- 		-- Control documentation window size
		-- 		-- border = "rounded",
		-- 		max_height = 30,
		-- 		max_width = 20,
		-- 	},
		-- },
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
			{ name = "cmdline" },
		}),
	})
end

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				-- Build Step is needed for regex support in snippets
				-- This step is not supported in many windows environments
				-- Remove the below condition to re-enable on windows
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
		},
		"saadparwaiz1/cmp_luasnip",
		-- Adds other completion capabilities.
		--  nvim-cmp does not ship with all sources by default. They are split
		--  into multiple repos for maintenance purposes.
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",

		-- If you want to add a bunch of pre-configured snippets,
		--    you can use this plugin to help you. It even has snippets
		--    for various frameworks/libraries/etc. but you will have to
		--    set up the ones that are useful for you.
		"rafamadriz/friendly-snippets",
	},
	config = function()
		configuration()
	end,
}
