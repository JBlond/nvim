return {
    "f-person/git-blame.nvim",
    event = "BufReadPost",
    opts = {
        enabled = true,
        message_template = "<<sha>> - <date> • <summary> • <author>", -- template for the blame message, check the Message template section for more options
        date_format = "%Y.%m.%d %H:%M:%S", -- template for the date, check Date format section for more options
        virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
    },
}
