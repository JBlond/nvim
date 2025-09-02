return {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { "markdown" }, -- load only in Markdown files
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-mini/mini.nvim'
    },
    config = function()
        local render = require('render-markdown')
        render.setup({
            render_modes = { 'n', 'c', 't' },
        })

        local enabled = true
        vim.keymap.set("n", "<leader>r", function()
            if enabled then
                render.disable()
                vim.notify("Markdown Rendering OFF")
            else
                render.enable()
                vim.notify("Markdown Rendering ON")
            end
            enabled = not enabled
        end, { desc = "Toggle Markdown Rendering" })
    end
}
