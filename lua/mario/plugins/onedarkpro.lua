return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        vim.cmd.colorscheme("onedark")
        local themes = {
            "onedark",
            "onedark_dark",
            "onelight",
            "vaporwave",
        }

        vim.cmd.colorscheme(themes[1])

        vim.keymap.set("n", "<leader>tc", function()
            vim.ui.select(themes, {
                prompt = "Colorscheme:",
            }, function(choice)
                if choice then
                    vim.cmd.colorscheme(choice)
                end
            end)
        end, { desc = "Choose colorscheme" })
    end
}
