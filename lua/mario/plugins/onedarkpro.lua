return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        -- normal
        vim.cmd("colorscheme onedark")

        -- for light-mode
        -- vim.cmd("colorscheme onelight")

        -- for more contrast
        -- vim.cmd("colorscheme onedark_dark")
    end
}
