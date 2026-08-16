return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    tag = "v0.2.1",
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
