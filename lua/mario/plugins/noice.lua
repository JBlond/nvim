return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify"
    },
    opts = {
        -- your configuration comes here
        enabled = false,  -- if you want to enable the plugin
    }
}
