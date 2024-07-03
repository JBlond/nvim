return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    require("lualine").setup {
    sections = {
        lualine_z = {
            {
                function()
                    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                        if vim.api.nvim_buf_get_option(buf, 'modified') then
                            return 'Unsaved buffers' -- any message or icon
                        end
                    end
                    return ''
                end,
            },
        },
    },
}
  end
}
