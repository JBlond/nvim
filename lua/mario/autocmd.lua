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
