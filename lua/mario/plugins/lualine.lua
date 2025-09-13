return {
    "nvim-lualine/lualine.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    config = function()
    require("lualine").setup {
        sections = {
            lualine_z = {
                {
                    function()
                        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                            if vim.api.nvim_buf_get_option(buf, "modified") then
                                    return "Unsaved buffers"

                            end
                        end
                        return ""
                    end
                },
                {
                    function()
                    local current_line = vim.fn.line(".")
                    local total_lines = vim.fn.line("$")
                    return string.format("%d:%d", current_line, total_lines)
                    end
                }
            }
        }
    }
    end
}
