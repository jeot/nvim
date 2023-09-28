vim.opt.foldmethod = "expr"
vim.opt.foldlevelstart = 0
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 3
-- vim.opt.foldcolumn = "auto"
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.relativenumber = false
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 4
vim.opt.showmode = false
vim.opt.modeline = false
vim.opt.showcmd = true
vim.opt.signcolumn = "yes" --"auto"
vim.opt.cmdheight = 1
vim.opt.timeout = true
vim.opt.timeoutlen = 3000
vim.opt.ttimeoutlen = 10
vim.opt.encoding = "utf-8"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.history = 500
vim.opt.ruler = true
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
--vim.opt.colorcolumn = { 80 }
vim.opt.wildmenu = true
vim.opt.wildignore = "*.o,*.obj,*.bak,*.exe"
vim.opt.paste = false
vim.opt.autoread = true
vim.opt.mouse = "a"
vim.opt.list = true
--      ﰴ  ﲒ ﲖ  ﰲ 壟 ﬋     
-- vim.opt.listchars = { tab = '• ', trail = '•', nbsp = '+', extends = '»' }
-- vim.opt.listchars = { tab = ' ', trail = '•', nbsp = '+', extends = '»' }
vim.opt.listchars = { tab = ' ', trail = '•', nbsp = '+', extends = '' }
vim.opt.background = "dark"
vim.opt.sessionoptions = "blank,buffers,folds,help,tabpages,winsize,terminal,sesdir,unix,slash"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-- vim.opt.guicursor = "n-v-c-sm-i-ci-ve-r-cr-o:block"
vim.opt.cursorline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.shortmess:append "c"
vim.opt.showtabline = 2
vim.opt.clipboard = "unnamedplus"
-- set powershell for windwos
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-Command"
vim.opt.shellquote = ''
vim.opt.shellxquote = ''
vim.opt.shellredir = '| Out-File -Encoding UTF8 %s'
vim.opt.shellpipe = '| Out-File -Encoding UTF8 %s'
-- set font if gui is available
if vim.fn.has('gui') then
	vim.cmd [[ set guifont=Mononoki\ NF:h17 ]]
end

