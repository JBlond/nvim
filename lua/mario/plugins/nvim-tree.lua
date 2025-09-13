return {
    "kyazdani42/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
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
