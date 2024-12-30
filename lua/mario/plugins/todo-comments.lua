return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        signs = true,
        keywords = {
            TODO = { icon = "ℹ️ ", color = "info" },
            WARN = { icon = "❌ ", color = "warning", alt = { "WARNING", "XXX" } },
        }
    }
}
