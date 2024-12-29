return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        -- Leader he für „help“ - oder was auch immer für dich Sinn ergibt.
        vim.keymap.set("n", "<leader>he", ":Telescope help_tags<CR>")

        -- search inside files
        vim.keymap.set("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<CR>")

        -- find files like in sublime and VSCode
        vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>")

        -- Grep (find grep)
        vim.keymap.set("n", "<M-f>", ":Telescope live_grep<CR>")

        require("telescope").setup {
            file_ignore_patterns = {".git/", "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*"}
        }
    end
}
