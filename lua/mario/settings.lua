-- change my cursor
vim.o.guicursor = 'n-v-c-sm-i-ci-ve:hor20,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

-- Show line numbers
vim.wo.number = true

-- Set Leader Key
-- Leader = any key that you like
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- key shortcut, to make :waq easier
--
-- Parameter 1: Mode (n = normal, i = insert…)
-- Parameter 2: key shortcut (Leader, then w for „write“)
-- Parameter 3: Change key
--              colon wa Enter; colon q Enter
vim.keymap.set("n", "<leader>q", ":wa<CR> :q<CR>")

-- fast save
vim.keymap.set("n", "<leader>w", ":wa<CR>")

-- :help vim.keymap.set


-- Follow Help-Links with Enter
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = "help",
  callback = function ()
    vim.keymap.set("n", "<CR>", "<C-]>", {buffer = true})
  end
})


-- key shortcut with Callback
vim.keymap.set("n", "<leader>n", function ()
    vim.wo.number = not vim.wo.number
    vim.wo.relativenumber = not vim.wo.relativenumber
end)


-- color schema
-- vim.o.background = 'light'
vim.o.background = 'dark'


-- indent with 4 Spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true


-- continue indent
vim.o.smartindent = true

-- save Undo-Historie
vim.opt.undofile = true


-- restore last position when open a file
vim.api.nvim_command([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])

-- netrw disable
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
