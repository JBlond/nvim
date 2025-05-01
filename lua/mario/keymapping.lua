vim.g.mapleader = ' '                                                                         -- Set Leader key SPACE
vim.g.maplocalleader = ' '                                                                    -- Leader = My Prefix for custom key shortcuts
                                                                                              --
                                                                                              -- Parameter 1: Mode (n = normal, i = insert…)
                                                                                              -- Parameter 2: key shortcut (Leader, then w for „write“)
                                                                                              -- Parameter 3: Other keys
                                                                                              --              Colon wa Enter; colon q Enter
vim.keymap.set("n", "<leader>q", ":wa<CR> :q<CR>", { desc = 'save and [q]uit'})               -- fast save && quit
vim.keymap.set("n", "<leader>w", ":wa<CR>", { desc = '[w]rite / save all'})                   -- fast save
vim.keymap.set("n", "<C-s>", ":wa<CR>", { desc = 'write / [s]ave all' })                      -- fast save
vim.keymap.set("n", "<C-n>", ":bnext<CR>", { desc = '[n]ext buffer' })                        -- move among buffers with CTRL + n (next)
                                                                                              -- :help vim.keymap.set
                                                                                              -- 
vim.keymap.set("n", "<leader>n",                                                              -- key shortcuts with Callback
    function()        
        vim.wo.number = not vim.wo.number
        vim.wo.relativenumber = not vim.wo.relativenumber
    end,
    , { desc = 'toogle relative [n]umbering' }
)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')                                           -- but clear on pressing <Esc> in normal mode

-- Telescope
vim.keymap.set("n", "<leader>he", ":Telescope help_tags<CR>", { desc = '[he]lp' })            -- Leader he für „help“
vim.keymap.set("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<CR>", { desc = '[f]ind' }) -- search inside files
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>")                                     -- find files like in sublime and VSCode
vim.keymap.set("n", "<M-f>", ":Telescope live_grep<CR>", { desc = 'grep [f]ind' })            -- Grep (find grep)

-- nvim-tree
vim.keymap.set("n", "<leader>sf", ":NvimTreeToggle<CR>", { desc = '[s]how [f]iles'})          -- sf - show files
vim.keymap.set("n", "<leader>jf", ":NvimTreeFindFile<CR>zz", { desc = '[j]jump to [f]ile'})   -- jump (to) file, then center (zz)

-- todo-comments
vim.keymap.set("n", "<M-t>", ":TodoTelescope<CR>", { desc = 'toggle [t]odo'}) -- toggle Todo

vim.keymap.set("n", "<C-k>", ":Screenkey toggle<CR>" , { desc = 'toggle Scren [k]ey'}) -- toggle Screenkey
