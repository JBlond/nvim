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
            require("telescope.pickers")
                .new({}, {
                    prompt_title = "Colorschemes",

                    finder = require("telescope.finders").new_table({
                        results = themes,
                    }),

                    sorter = require("telescope.config").values.generic_sorter({}),

                    previewer = false,

                    attach_mappings = function(_, map)
                        map("i", "<CR>", function(prompt_bufnr)
                            local action_state = require("telescope.actions.state")
                            local actions = require("telescope.actions")

                            local selection = action_state.get_selected_entry()

                            if selection then
                                vim.cmd.colorscheme(selection.value)
                            end

                            actions.close(prompt_bufnr)
                        end)

                        return true
                    end,
                })
                :find()
        end, { desc = "Choose colorscheme" })
    end
}
