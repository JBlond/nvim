return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first

    config = function()
        local themes = {
            {
                name = "onedark",
                desc = "Klassisches OneDark Theme",
                style = "Dunkel",
            },
            {
                name = "onedark_dark",
                desc = "Dunklere Variante von OneDark",
                style = "Sehr dunkel",
            },
            {
                name = "vaporwave",
                desc = "Bunte Synthwave / Vaporwave Optik",
                style = "Dunkel · Neon",
            },
            {
                name = "kanagawa-wave",
                desc = "Dunkles, ruhiges Kanagawa Theme",
                style = "Dunkel · Blau",
            },
            {
                name = "kanagawa-dragon",
                desc = "Dunkles Kanagawa mit warmen Farben",
                style = "Dunkel · Warm",
            },
            {
                name = "kanagawa-lotus",
                desc = "Helles Kanagawa Theme",
                style = "Hell",
            },
            {
                name = "monokai-pro",
                desc = "Monokai Pro – kontrastreich und farbig",
                style = "Dunkel · Bunt",
            },
        }

        vim.cmd.colorscheme(themes[1].name)

        vim.keymap.set("n", "<leader>tc", function()
            local pickers = require("telescope.pickers")
            local finders = require("telescope.finders")
            local sorters = require("telescope.config").values.generic_sorter
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            local previewers = require("telescope.previewers")

            -- remember current theme
            local original_theme = vim.g.colors_name
            local theme_applied = false

            local preview_code = {
                'local M = {}',
                '',
                'function M.greet(name)',
                '    local message = "Hello, " .. name',
                '',
                '    if name == "Neovim" then',
                '        print(message)',
                '    else',
                '        print("Welcome, " .. name .. "!")',
                '    end',
                'end',
                '',
                'for _, user in ipairs({',
                '    "Alice",',
                '    "Bob",',
                '    "Neovim",',
                '}) do',
                '    M.greet(user)',
                'end',
                '',
                'return M',
            }

            local previewer = previewers.new_buffer_previewer({
                title = " Theme Preview ",

                define_preview = function(self, entry)
                    local theme = entry.value

                    -- Theme live anwenden
                    if vim.g.colors_name ~= theme.name then
                        vim.cmd.colorscheme(theme.name)
                    end

                    -- Code in Preview schreiben
                    vim.api.nvim_buf_set_lines(
                        self.state.bufnr,
                        0,
                        -1,
                        false,
                        preview_code
                    )

                    -- Lua Syntax Highlighting
                    vim.bo[self.state.bufnr].filetype = "lua"
                    vim.bo[self.state.bufnr].buftype = "nofile"
                    vim.bo[self.state.bufnr].bufhidden = "wipe"
                    vim.bo[self.state.bufnr].swapfile = false

                    -- Cursor verstecken
                    vim.api.nvim_win_set_cursor(
                        self.state.winid,
                        { 1, 0 }
                    )
                end,
            })

            local picker = pickers.new({}, {
                prompt_title = "Colorschemes",

                layout_strategy = "horizontal",

                layout_config = {
                    width = 0.90,
                    height = 0.80,
                    preview_width = 0.50,
                },

                finder = finders.new_table({
                    results = themes,

                    entry_maker = function(entry)
                        return {
                            value = entry,

                            display = string.format(
                                "%-20s │ %s",
                                entry.name,
                                entry.desc
                            ),

                            ordinal = entry.name .. " " .. entry.desc,
                        }
                    end,
                }),

                sorter = sorters({}),

                previewer = previewer,

                attach_mappings = function(prompt_bufnr, map)

                    -- Enter = Apply Theme
                    map("i", "<CR>", function()
                        local selection =
                            action_state.get_selected_entry()

                        if selection then
                            vim.cmd.colorscheme(
                                selection.value.name
                            )

                            theme_applied = true
                        end

                        actions.close(prompt_bufnr)
                    end)

                    -- Escape = restore theme
                    map("i", "<Esc>", function()
                        if not theme_applied and original_theme then
                            vim.cmd.colorscheme(original_theme)
                        end

                        actions.close(prompt_bufnr)
                    end)

                    -- Also in normal mode
                    map("n", "<Esc>", function()
                        if not theme_applied and original_theme then
                            vim.cmd.colorscheme(original_theme)
                        end

                        actions.close(prompt_bufnr)
                    end)

                    -- if Telescope is being closed another way
                    vim.api.nvim_create_autocmd("BufWipeout", {
                        buffer = prompt_bufnr,
                        once = true,

                        callback = function()
                            if not theme_applied and original_theme then
                                vim.schedule(function()
                                    vim.cmd.colorscheme(original_theme)
                                end)
                            end
                        end,
                    })

                    return true
                end,
            })

            picker:find()
        end, { desc = "Choose colorscheme" })
    end,
}
