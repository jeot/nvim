-- lines
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 9
vim.opt.showcmd = true
vim.opt.cmdheight = 0

-- tab
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- editing line
--      ﰴ   ﲒ ﲖ  ﰲ 壟 ﬋     ···␣  󰇘 󰌑
vim.opt.list = true
vim.opt.listchars = { tab = " ", trail = "·", nbsp = "␣", extends = "󰇘" }
-- vim.opt.listchars = { tab = '• ', trail = '•', nbsp = '+', extends = '»' }
-- vim.opt.listchars = { tab = ' ', trail = '•', nbsp = '+', extends = '󰇘', eol = '󰌑' }
vim.opt.sessionoptions = "blank,buffers,folds,help,tabpages,winsize,terminal,sesdir,unix,slash"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.cursorline = true
vim.opt.breakindent = true

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- split
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.signcolumn = "yes:1" --"auto"
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.undofile = false

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 3
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.exrc = false
vim.opt.secure = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.modeline = false
vim.opt.timeout = false
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10
vim.opt.encoding = "utf-8"
vim.opt.backspace = { "indent", "eol", "start" }
-- vim.opt.fixendofline = false
vim.opt.history = 500
vim.opt.ruler = true
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
--vim.opt.colorcolumn = { 80 }
vim.opt.wildmenu = true
vim.opt.wildignore = "*.o,*.obj,*.bak,*.exe"
vim.opt.paste = false
vim.opt.autoread = true
vim.opt.inccommand = "split"

vim.opt.shortmess:append("c")
vim.opt.showtabline = 1
-- vim.opt.clipboard = "unnamedplus"
-- set powershell for windwos
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-Command"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
