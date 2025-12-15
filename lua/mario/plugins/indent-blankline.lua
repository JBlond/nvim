return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPost",
    main = "ibl",
    config = function()
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }

        local hooks = require "ibl.hooks"
        hooks.register(
            hooks.type.HIGHLIGHT_SETUP, function()
                local colors = require("onedarkpro.helpers").get_colors()
                vim.api.nvim_set_hl(0, "RainbowRed",        { fg = colors.red })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = colors.yellow })
                vim.api.nvim_set_hl(0, "RainbowBlue",     { fg = colors.blue })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = colors.orange })
                vim.api.nvim_set_hl(0, "RainbowGreen",    { fg = colors.green })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = colors.purple })
                vim.api.nvim_set_hl(0, "RainbowCyan",     { fg = colors.cyan })
            end
        )

        require("ibl").setup {
            indent = { char = "│", highlight = highlight },
        }

        -- Toggle-Funktion
        local enabled = true
        vim.keymap.set("n", "<leader>i", function()
            if enabled then
                require("ibl").update { enabled = false }
                enabled = false
                print("Indent lines OFF")
            else
                require("ibl").update { enabled = true }
                enabled = true
                print("Indent lines ON")
            end
        end, { desc = "Toggle indent lines" })
    end
}
