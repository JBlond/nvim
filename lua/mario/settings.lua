vim.loader.enable()                                  -- gain some speed

-- Disable Language providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.termguicolors = true                         -- use all colors
vim.opt.guicursor = 'a:hor20'                        -- set the cursor
if vim.g.neovide then
	vim.o.guifont = "LucidaConsole Nerd Font Mono:h16"
end
vim.opt.cursorline = true                            -- Show which line your cursor is on
-- vim.opt.cursorcolumn = true                       -- highlight the current column
vim.opt.inccommand = 'split'                         -- Preview substitutions live, as you type!

vim.opt.hlsearch = true                              -- Set highlight on search,

vim.wo.number = true                                 -- Show line numbers
vim.opt.listchars = {
    tab = '»»' ,
    trail = '·' ,
    extends = '>',
    precedes = '<',
    eol = '↲',
    nbsp = '␣'
}
vim.opt.list = true                                  -- show "hidden" list characters
vim.wo.wrap = false                                  -- don't break lines
vim.wo.linebreak = false                             -- don't break lines
vim.opt.whichwrap:append("<,>,h,l,[,]")              -- make the left and right arrow keys change line

vim.opt.signcolumn = yes                             -- show column before number for ToDo Plugin
vim.opt.conceallevel = 0                             -- show `` in markdown files

-- indent with 4 Spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true                             -- set to false to use tabs instead of space
                                                     -- Setting 'expandtab' does not affect any existing tabs.
                                                     -- convert tabs to spaces
                                                     -- :set expandtab
                                                     -- :%retab!
                                                     -- space to tab :set noexpandtab
                                                     -- :%retab!

vim.opt.smartindent = true                           -- resume indent
vim.opt.undofile = true                              -- save Undo-Historie
vim.opt.hidden = true                                -- allows you to hide buffers with unsaved changes without being prompted

function my_paste(reg)
    return function(lines)

        --[ Returns the contents of the "" register, used as paste for the p operator]
        local content = vim.fn.getreg('"')
        return vim.split(content, '\n')

    end
end

if (os.getenv('SSH_TTY') == nil)
then
    --[The current environment is the local environment, which also includes WSL]
    opt.clipboard:append("unnamedplus")  -- use System-Clipboard
else
    opt.clipboard:append("unnamedplus")  -- use System-Clipboard
    vim.g.clipboard = {
      name = 'OSC 52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
      },
      paste = {
        --[The content inside the parentheses may be meaningless, but it might look better left as is.]
        ["+"] = my_paste("+"),
        ["*"] = my_paste("*"),


    }
}
end

vim.opt.smartcase = true                             -- use case sensitive if capital letter present or \C
vim.opt.ignorecase = true                            -- ignore case in searches
vim.opt.incsearch = true                             -- do incremental searching
vim.opt.magic = true                                 -- Use 'magic' patterns (extended regular expressions).

-- go to the last postion when re-open a file
vim.api.nvim_command([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
