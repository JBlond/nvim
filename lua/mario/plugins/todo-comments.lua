return {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    opts = {
        highlight = {
            comments_only = false,
        },
        keywords = {
            BUG  = { icon = "🐛", color = "error", alt = { "BROKEN", "FIXME", "ISSUE" } },
            HACK = { icon = "🔥", color = "warning" },
            IDEA = { icon = "💡", color = "test" },
            NOTE = { icon = "ℹ️", color = "hint", alt = { "INFO" } },
            TEST = { icon = "🧪", color = "test", alt = { "EXPERIMENT", "TESTING" } },
            TODO = { icon = "✅", color = "info" },
            WARN = { icon = "⚠️", color = "warning", alt = { "WARNING", "XXX" } },
        },
    },
}
