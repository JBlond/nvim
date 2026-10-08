return {
    "nvim-treesitter/nvim-treesitter",
    ft = "markdown",
    event = "BufReadPost",
    opts = {
        ensure_installed = {
            "bash",
            "regex",
        }
    }
}
