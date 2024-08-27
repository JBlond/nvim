-- Disable Language providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.termguicolors = true                       -- use all colors
vim.opt.guicursor = 'a:hor20'                      -- set the cursor
vim.opt.cursorline = true                          -- Show which line your cursor is on
vim.opt.inccommand = 'split'                       -- Preview substitutions live, as you type!

vim.opt.hlsearch = true                            -- Set highlight on search,
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')-- but clear on pressing <Esc> in normal mode
vim.wo.number = true                               -- line numbers
vim.opt.listchars = {
    tab = '»»' ,
    trail = '·' ,
    extends = '>',
    precedes = '<',
    eol = '↲',
    nbsp = '␣'
}
vim.opt.list = true                                 -- show "hidden" list characters
vim.wo.wrap = false                                 -- don't break lines
vim.wo.linebreak = false                            -- don't break lines

vim.g.mapleader = ' '                               -- Set Leader key SPACE
vim.g.maplocalleader = ' '                          -- Leader = My Prefix for custom key shortcuts

vim.opt.whichwrap:append("<,>,h,l,[,]")             -- make the left and right arrow keys change line

                                                    -- key shortcut, to make :waq easier
                                                    --
                                                    -- Parameter 1: Mode (n = normal, i = insert…)
                                                    -- Parameter 2: key shortcut (Leader, then w for „write“)
                                                    -- Parameter 3: Other keys
                                                    --              Colon wa Enter; colon q Enter
vim.keymap.set("n", "<leader>q", ":wa<CR> :q<CR>")  -- fast save && quit
vim.keymap.set("n", "<leader>w", ":wa<CR>")         -- fast save
vim.keymap.set("n", "<C-p>", ":bprevious<CR>")      -- move among buffers with CTRL + p (previous)
vim.keymap.set("n", "<C-n>", ":bnext<CR>")          -- move among buffers with CTRL + n (next)
                                                    -- :help vim.keymap.set
vim.keymap.set("n", "<leader>n", function ()        -- key shortcuts with Callback
    vim.wo.number = not vim.wo.number
    vim.wo.relativenumber = not vim.wo.relativenumber
end)

vim.api.nvim_create_autocmd({"VimLeave"}, {         -- fix wrong cursor when leaving tmux
    callback = function ()
        vim.cmd('nvim_cursor_set_shape("horizontal-bar")')
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {         -- Follow Help-Links via Enter
    pattern = "help",
    callback = function ()
        vim.keymap.set("n", "<CR>", "<C-]>", {buffer = true})
    end
})


-- indent with 4 Spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true                           -- resume indent
vim.opt.undofile = true                              -- save Undo-Historie
vim.opt.clipboard = 'unnamedplus'                    -- use System-Clipboard
vim.opt.hidden = true                                -- allows you to hide buffers with unsaved changes without being prompted

vim.opt.smartcase = true                             -- use case sensitive if capital letter present or \C
vim.opt.ignorecase = true                            -- ignore case in searches
vim.opt.incsearch = true                             -- do incremental searching
vim.opt.magic = true                                 -- Use 'magic' patterns (extended regular expressions).

-- go to the last postion when re-open a file
vim.api.nvim_command([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.loader.enable()                                  -- gain some speed
