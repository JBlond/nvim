return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        -- Leader he für „help“ - oder was auch immer für dich Sinn ergibt.
        vim.keymap.set("n", "<leader>he", ":Telescope help_tags<CR>")

        -- search inside files (fi - find)
        vim.keymap.set("n", "<leader>fi", ":Telescope current_buffer_fuzzy_find<CR>")

        -- find files (ff)
        vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")

        -- Grep (fg - find grep)
        vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")

        -- What else?
        -- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers
        require("telescope").setup {
            file_ignore_patterns = {".git/", "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*"}
        }
    end
}
