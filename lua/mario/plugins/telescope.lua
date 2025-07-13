return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        require("telescope").setup {
            file_ignore_patterns = {".git/", "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*"}
        }
    end
}
