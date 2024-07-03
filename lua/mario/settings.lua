vim.o.guicursor = 'n-v-c-sm-i-ci-ve:hor20,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

-- make the left and right arrow keys change line
vim.opt.whichwrap:append("<,>,h,l,[,]") 

-- line numbers
vim.wo.number = true

vim.opt.listchars = { tab = '»»' ,trail = '·' ,extends = '>', precedes = '<' ,eol = '↲' }
vim.opt.list = true

-- don't break lines
vim.wo.wrap = false
vim.wo.linebreak = false

-- Set Leader key
-- Leader = My Prefix for custom key shortcuts
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- key shortcut, to make :waq easier
--
-- Parameter 1: Mode (n = normal, i = insert…)
-- Parameter 2: key shortcut (Leader, then w for „write“)
-- Parameter 3: Other keys
--              Colon wa Enter; colon q Enter
vim.keymap.set("n", "<leader>q", ":wa<CR> :q<CR>")

-- fast save
vim.keymap.set("n", "<leader>w", ":wa<CR>")

-- :help vim.keymap.set


-- Follow Help-Links via Enter
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = "help",
  callback = function ()
    vim.keymap.set("n", "<CR>", "<C-]>", {buffer = true})
  end
})


-- key shortcuts with Callback
vim.keymap.set("n", "<leader>n", function ()
    vim.wo.number = not vim.wo.number
    vim.wo.relativenumber = not vim.wo.relativenumber
end)


-- color schema
vim.o.background = 'dark'
-- vim.o.background = 'light'

vim.opt.termguicolors = true 
-- Enable GUI colors for the terminal to get truecolor

-- Einrückung mit 4 Spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true


-- resume indent
vim.o.smartindent = true


-- save Undo-Historie
vim.opt.undofile = true


-- use System-Clipboard
vim.o.clipboard = 'unnamedplus'


-- go to the last postion when re-open a file
vim.api.nvim_command([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])


-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
