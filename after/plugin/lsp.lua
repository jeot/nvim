local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
	'matlab_ls',
	'lua_ls',
	'clangd'
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<cr>zvzz', bufopts)
	vim.keymap.set('n', 'gh', ':lua vim.lsp.buf.hover()<cr>', bufopts)
	vim.keymap.set('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', bufopts)
	vim.keymap.set('n', ')', ':lua vim.diagnostic.goto_next()<cr>zvzz', bufopts)
	vim.keymap.set('n', '(', ':lua vim.diagnostic.goto_prev()<cr>zvzz', bufopts)
	vim.keymap.set('n', 'grr', ':lua vim.lsp.buf.references()<cr>', bufopts)
	vim.keymap.set('n', 'go', ':lua vim.lsp.buf.type_definition()<cr>zvzz', bufopts)
	vim.keymap.set('n', ']d', ':lua vim.diagnostic.goto_next()<cr>zvzz', bufopts)
	vim.keymap.set('n', '[d', ':lua vim.diagnostic.goto_prev()<cr>zvzz', bufopts)
	vim.keymap.set('i', '<c-h>', function() vim.lsp.buf.signature_help() end, bufopts)
	vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>', bufopts)
	vim.keymap.set('n', 'grn', ':lua vim.lsp.buf.rename()<cr>', bufopts)
	vim.keymap.set('n', '<leader>le', ':lua vim.diagnostic.enable()<CR>', bufopts) -- enable lsp diagnosti
	vim.keymap.set('n', '<leader>ld', ':lua vim.diagnostic.disable()<CR>', bufopts) -- disable lsp diagnosti
	vim.keymap.set('n', '<space>vd', ':lua vim.diagnostic.open_float()<CR>', bufopts)
	vim.keymap.set('n', '<space>fo', ':lua vim.lsp.buf.format()<CR>', bufopts)
	-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
end

lsp.on_attach(on_attach)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- run clangd lsp
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
require('lspconfig').clangd.setup({
	on_attach = on_attach,
	flags = { debounce_text_changes = 150 },
	settings = {
		CPP = {
			diagnostics = {
				globals = {'printf', 'sprintf', 'EEPROM'},
			}
		}
	}
})

lsp.set_sign_icons({ error = '', warn = '', hint = '', info = '' })

lsp.setup()
