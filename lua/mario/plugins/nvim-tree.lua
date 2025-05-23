return {
    "kyazdani42/nvim-tree.lua",
    event = "VeryLazy",
    dependencies = {
        -- nice Icons
        "kyazdani42/nvim-web-devicons",
        "echasnovski/mini.nvim"
    },
    config = function()
        require("nvim-tree").setup(
            {
                view = {
                    width = 40
                }
            }
        )
    end
}
