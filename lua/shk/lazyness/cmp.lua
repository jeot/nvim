local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local function configuration()
	-- See `:help cmp`
	local cmp = require 'cmp';
	local luasnip = require 'luasnip';
	luasnip.config.setup {}

	return {
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
				-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			end,
		},

		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},

		mapping = cmp.mapping.preset.insert {
			-- Select the [n]ext/[p]revious item
			['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 'c'}),
			['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 'c'}),
			['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 'c'}),
			['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 'c'}),

			-- Accept ([y]es) the completion.
			--  This will auto-import if your LSP supports it.
			--  This will expand snippets if the LSP sent a snippet.
			['<C-y>'] = cmp.mapping(cmp.mapping.confirm { select = true }, { 'i', 'c' }),

			-- Manually trigger a completion from nvim-cmp.
			--  Generally you don't need this, because nvim-cmp will display
			--  completions whenever it has completion options available.
			-- ['<C-Space>'] = cmp.mapping.complete {},

			-- Think of <c-l> as moving to the right of your snippet expansion.
			--  So if you have a snippet that's like:
			--  function $name($args)
			--    $body
			--  end
			--
			-- <c-l> will move you to the right of each of the expansion locations.
			-- <c-h> is similar, except moving you backwards.
			['<C-l>'] = cmp.mapping(function()
				if luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				end
			end, { 'i', 's' }),
			['<C-h>'] = cmp.mapping(function()
				if luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { 'i', 's' }),
			-- scroll documentation of the completion item
			['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-2), { 'i', 'c' }),
			['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(2), { 'i', 'c' }),
		},

		-- mapping = {
			-- ['<C-p>'] = cmp.mapping(function(fallback) fallback() end, { 'i', 'c' }),
			-- ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
			-- ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
			-- ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-2), { 'i', 'c' }),
			-- ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(2), { 'i', 'c' }),
			-- ['<C-y>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			-- ['<C-e>'] = cmp.mapping(cmp.mapping.abort(), { 'i', 'c' }),
			-- ['<CR>'] = cmp.mapping({
			-- 	i = cmp.mapping.confirm({ select = true }),
			-- 	c = cmp.mapping.confirm({ select = false }),
			-- }),
			-- ["<Tab>"] = cmp.mapping(function(fallback)
			-- 	if cmp.visible() then
			-- 		cmp.select_next_item()
			-- 	elseif luasnip.expandable() then
			-- 		luasnip.expand()
			-- 	elseif luasnip.expand_or_jumpable() then
			-- 		luasnip.expand_or_jump()
			-- 	elseif check_backspace() then
			-- 		fallback()
			-- 	else
			-- 		fallback()
			-- 	end
			-- end, { 'i', 'c' }),
			-- ["<S-Tab>"] = cmp.mapping(function(fallback)
			-- 	if cmp.visible() then
			-- 		cmp.select_prev_item()
			-- 	elseif luasnip.jumpable(-1) then
			-- 		luasnip.jump(-1)
			-- 	else
			-- 		fallback()
			-- 	end
			-- end, { 'i', 'c' }),
		-- },

		-- formatting = {
		-- 	fields = { "kind", "abbr", "menu" },
		-- 	format = function(entry, vim_item)
		-- 		-- Kind icons
		-- 		vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
		-- 		-- -- This concatonates the icons with the name of the item kind
		-- 		-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
		-- 		vim_item.menu = ({
		-- 			nvim_lsp = "[LSP]",
		-- 			luasnip = "[Snippet]",
		-- 			buffer = "[Buffer]",
		-- 			path = "[Path]",
		-- 		})[entry.source.name]
		-- 		return vim_item
		-- 	end,
		-- },

		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			-- { name = 'vsnip' }, -- For vsnip users.
			{ name = 'luasnip' }, -- For luasnip users.
			-- { name = 'ultisnips' }, -- For ultisnips users.
			-- { name = 'snippy' }, -- For snippy users.
			}, {
				{ name = 'buffer' },
				{ name = 'path' }
		})
	}
end

local function extra_config()
	local cmp = require('cmp');
	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
			{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
			{ name = 'buffer' },
		})
	})

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		})
	})
end


return {
	-- auto completion
	{
		'hrsh7th/nvim-cmp',
		config = function()
			require('cmp').setup(configuration())
			extra_config()
		end
	},
	{'hrsh7th/cmp-nvim-lsp'},
	{"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-path"},
	{"hrsh7th/cmp-cmdline"},

	-- code snippets
	{"L3MON4D3/LuaSnip"},
	{"saadparwaiz1/cmp_luasnip"},
	{"rafamadriz/friendly-snippets"},
}
