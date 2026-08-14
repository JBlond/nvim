return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        vim.cmd.colorscheme("onedark")
        vim.keymap.set("n", "<leader>tl", function()
            if vim.g.colors_name == "onedark" then
                vim.cmd.colorscheme("onedark_dark")
            else
                vim.cmd.colorscheme("onedark")
            end
        end, { desc = "Toggle light/dark colorscheme" })
    end
}
