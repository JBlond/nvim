vim.api.nvim_create_autocmd({"VimLeave"}, {          -- fix wrong cursor when leaving tmux
    callback = function ()
        vim.cmd('nvim_cursor_set_shape("horizontal-bar")')
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {          -- Follow Help-Links via Enter
    pattern = "help",
    callback = function ()
        vim.keymap.set("n", "<CR>", "<C-]>", {buffer = true})
    end
})

vim.api.nvim_create_autocmd("TextYankPost", {        -- Highlight yanked text
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
    end,
})
