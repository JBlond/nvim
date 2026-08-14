return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        icons   = { 
            mappings = false, 
            breadcrumb = "", 
            separator = " ", 
            group = "" 
        },
        replace = {
            key  = { function(k) return k end },
            desc = { },
        },
        filter  = function(m) return m.desc and m.desc ~= "" end,
        plugins = {
            marks=false, 
            registers=false, 
            spelling={
                enabled=false
            },
            presets = {
                operators=false, 
                motions=false, 
                text_objects=false,
                windows=false, 
                nav=false, 
                z=false, 
                g=false 
            }
        }
    }
}
