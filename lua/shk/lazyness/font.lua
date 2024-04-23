-- set font if gui is available
-- if vim.g.neovide or vim.fn.has('gui') then
--   -- vim.o.guifont = "Ubuntu Mono:h18"
--   vim.o.guifont = "Mononoki Nerd Font Mono:h15"
--   if vim.fn.hostname() == 'shk-system' then
--     vim.o.guifont = "Mononoki Nerd Font Mono:h17"
--   end
-- end
--
local font_name = "Mononoki Nerd Font Mono"
local font_size = 16
if vim.fn.hostname() == "shk-system" then
	font_size = 18
end

return {
	"Sup3Legacy/fontsize.nvim",
	config = function()
		require("fontsize").init({
			-- Required argument
			-- font = "Mononoki Nerd Font Mono",
			font = font_name,

			-- Optional arguments
			min = 3,
			default = font_size,
			max = 32,
			step = 1,
		})
		vim.keymap.set("n", "<C-=>", "<cmd>FontIncrease<CR>")
		vim.keymap.set("n", "<C-->", "<cmd>FontDecrease<CR>")
		vim.keymap.set("n", "<C-0>", "<cmd>FontReset<CR>")
		vim.keymap.set("i", "<C-=>", "<cmd>FontIncrease<CR>")
		vim.keymap.set("i", "<C-->", "<cmd>FontDecrease<CR>")
		vim.keymap.set("i", "<C-0>", "<cmd>FontReset<CR>")
	end,
}
