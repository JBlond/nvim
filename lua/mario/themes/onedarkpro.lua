return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first

    config = function()
        local themes = {
            {
                name = "onedark",
                desc = "Classic OneDark theme",
                style = "Dark",
                background = "dark",
            },
            {
                name = "onedark_dark",
                desc = "Darker variant of OneDark",
                style = "Very dark",
                background = "dark",
            },
            {
                name = "vaporwave",
                desc = "Colorful Synthwave / Vaporwave aesthetic",
                style = "Dark · Neon",
                background = "dark",
            },
            {
                name = "monokai-pro",
                desc = "Monokai Pro – high-contrast and colorful",
                style = "Dark · Colorful",
                background = "dark",
            },
            {
                name = "kanagawa-wave",
                desc = "Dark, calm Kanagawa theme",
                style = "Dark · Blue",
                background = "dark",
            },
            {
                name = "kanagawa-dragon",
                desc = "Dark Kanagawa with warm colors",
                style = "Dark · Warm",
                background = "dark",
            },
            {
                name = "kanagawa-lotus",
                desc = "Light Kanagawa theme",
                style = "Light",
                background = "light",
            },
        }

        local function apply_theme(theme)
            vim.o.background = theme.background or "dark"

            if vim.g.colors_name == theme.name then
                return true
            end

            local ok = pcall(vim.cmd.colorscheme, theme.name)

            if not ok then
                vim.notify(
                    "Could not load colorscheme: " .. theme.name,
                    vim.log.levels.ERROR
                )
                return false
            end

            return true
        end

        -- Initial theme
        apply_theme(themes[1])

        vim.keymap.set("n", "<leader>tc", function()
            local pickers = require("telescope.pickers")
            local finders = require("telescope.finders")
            local sorters = require("telescope.config").values.generic_sorter
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            local previewers = require("telescope.previewers")

            -- Remember the theme before opening the picker
            local original_theme = vim.g.colors_name
            local original_background = vim.o.background

            -- Only set when the user explicitly presses Enter
            local selected_theme = nil

            local preview_code = {
                "local config = {",
                '    editor = "Neovim",',
                "    version = 0.10,",
                "    enabled = true,",
                "}",
                "",
                "-- A simple function",
                "local function greet(name)",
                '    local message = "Hello, " .. name .. "!"',
                "",
                "    if config.enabled then",
                "        print(message)",
                "    else",
                '        vim.notify("Disabled", vim.log.levels.WARN)',
                "    end",
                "end",
                "",
                "-- Tables and loops",
                "local users = {",
                '    "Alice",',
                '    "Bob",',
                '    "Charlie",',
                "}",
                "",
                "for index, user in ipairs(users) do",
                "    print(index, user)",
                "    greet(user)",
                "end",
                "",
                "-- Error handling",
                "local ok, result = pcall(function()",
                "    return vim.fn.getcwd()",
                "end)",
                "",
                "if not ok then",
                '    vim.notify("Something went wrong!",',
                "        vim.log.levels.ERROR)",
                "end",
                "",
                'vim.api.nvim_set_keymap("n", "<leader>x",',
                '    ":echo \\"Hello!\\"<CR>",',
                "    { noremap = true, silent = true })",
                "",
                "return config",
            }

            local function restore_theme()
                if selected_theme ~= nil then
                    return
                end

                if not original_theme then
                    return
                end

                vim.schedule(function()
                    vim.o.background = original_background
                    pcall(vim.cmd.colorscheme, original_theme)
                end)
            end

            local previewer = previewers.new_buffer_previewer({
                title = " Theme Preview ",

                define_preview = function(self, entry)
                    local theme = entry.value

                    -- Live theme preview
                    apply_theme(theme)

                    -- Write code into preview buffer
                    vim.api.nvim_buf_set_lines(
                        self.state.bufnr,
                        0,
                        -1,
                        false,
                        preview_code
                    )

                    -- Lua syntax highlighting
                    vim.bo[self.state.bufnr].filetype = "lua"
                    vim.bo[self.state.bufnr].buftype = "nofile"
                    vim.bo[self.state.bufnr].bufhidden = "wipe"
                    vim.bo[self.state.bufnr].swapfile = false

                    vim.wo[self.state.winid].number = true
                    vim.wo[self.state.winid].relativenumber = false

                    -- Hide cursor
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
                                "%-20s │ %-16s │ %s",
                                entry.name,
                                entry.style,
                                entry.desc
                            ),

                            ordinal = table.concat({
                                entry.name,
                                entry.desc,
                                entry.style,
                            }, " "),
                        }
                    end,
                }),

                sorter = sorters({}),

                previewer = previewer,

                attach_mappings = function(prompt_bufnr, map)

                    local function apply_selection()
                        local selection =
                            action_state.get_selected_entry()

                        if selection then
                            local theme = selection.value

                            if apply_theme(theme) then
                                selected_theme = theme.name
                            end
                        end

                        actions.close(prompt_bufnr)
                    end

                    -- Enter = Apply Theme
                    map("i", "<CR>", apply_selection)
                    map("n", "<CR>", apply_selection)

                    -- Escape = Restore original theme
                    map("i", "<Esc>", function()
                        restore_theme()
                        actions.close(prompt_bufnr)
                    end)

                    map("n", "<Esc>", function()
                        restore_theme()
                        actions.close(prompt_bufnr)
                    end)

                    -- Restore theme if Telescope is closed another way
                    vim.api.nvim_create_autocmd("BufWipeout", {
                        buffer = prompt_bufnr,
                        once = true,

                        callback = function()
                            restore_theme()
                        end,
                    })

                    return true
                end,
            })

            picker:find()
        end, {
            desc = "Choose colorscheme",
        })
    end,
}
