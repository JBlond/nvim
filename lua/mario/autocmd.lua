-- fix wrong cursor when leaving tmux
vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
    vim.fn.system('nvim_cursor_set_shape("horizontal-bar")')
    end,
})

-- Follow Help-Links via Enter
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function()
    vim.keymap.set("n", "<CR>", "<C-]>", { buffer = true, silent = true })
    end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
    end,
})
