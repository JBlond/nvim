vim.o.background = 'dark' -- color schema
vim.o.guicursor = 'n-v-c-sm-i-ci-ve:hor20,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor' --set cursor

vim.wo.number = true -- line numbers
vim.opt.listchars = { tab = '»»' ,trail = '·' ,extends = '>', precedes = '<' ,eol = '↲' }
vim.opt.list = true
vim.wo.wrap = false -- don't break lines
vim.wo.linebreak = false -- don't break lines

vim.g.mapleader = ' ' -- Set Leader key SPACE
vim.g.maplocalleader = ' ' -- Leader = My Prefix for custom key shortcuts

vim.opt.whichwrap:append("<,>,h,l,[,]") -- make the left and right arrow keys change line

-- key shortcut, to make :waq easier
--
-- Parameter 1: Mode (n = normal, i = insert…)
-- Parameter 2: key shortcut (Leader, then w for „write“)
-- Parameter 3: Other keys
--              Colon wa Enter; colon q Enter
vim.keymap.set("n", "<leader>q", ":wa<CR> :q<CR>")
vim.keymap.set("n", "<leader>w", ":wa<CR>") -- fast save
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

-- indent with 4 Spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true -- resume indent

vim.opt.undofile = true -- save Undo-Historie

vim.o.clipboard = 'unnamedplus' -- use System-Clipboard
vim.opt.hidden = true -- allows you to hide buffers with unsaved changes without being prompted

-- go to the last postion when re-open a file
vim.api.nvim_command([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])


-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
