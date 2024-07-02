vim.o.guicursor = 'n-v-c-sm-i-ci-ve:hor20,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

-- make the left and right arrow keys change line
vim.opt.whichwrap:append("<,>,h,l,[,]") 

-- Zeilennummern
vim.wo.number = true

vim.opt.listchars = { tab = '»»' ,trail = '·' ,extends = '>', precedes = '<' ,eol = '↲' }
vim.opt.list = true

-- Leader Taste setzen
-- Leader = Beliebter Präfix für eigene Tastenkürzel
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Tastenkürzel, um :waq einfacher zu machen
--
-- Parameter 1: Mode (n = normal, i = insert…)
-- Parameter 2: Tastenkürzel (Leader, dann w für „write“)
-- Parameter 3: Andere Tasten
--              Doppelpunkt wa Enter; Doppelpunk q Enter
vim.keymap.set("n", "<leader>q", ":wa<CR> :q<CR>")

-- fast save
vim.keymap.set("n", "<leader>w", ":wa<CR>")

-- :help vim.keymap.set


-- Hilfe-Links mit Enter folgen
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = "help",
  callback = function ()
    vim.keymap.set("n", "<CR>", "<C-]>", {buffer = true})
  end
})


-- Tastenkürzel mit Callback
vim.keymap.set("n", "<leader>n", function ()
    vim.wo.number = not vim.wo.number
    vim.wo.relativenumber = not vim.wo.relativenumber
end)


-- Farbschema
-- vim.o.background = 'light'
vim.o.background = 'dark'


-- Einrückung mit 4 Spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true


-- Aktuelle Einrückung fortführen
vim.o.smartindent = true


-- Undo-Historie abspeichern
vim.opt.undofile = true


-- System-Clipboard verwenden
vim.o.clipboard = 'unnamedplus'


-- Beim Wiederöffnen einer Datei zur letzten Position springen
vim.api.nvim_command([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])


-- netrw ausschalten
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
