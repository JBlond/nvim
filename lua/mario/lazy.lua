-- Lazy Plugin Manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Put Plugin files in ~/.config/nvim/lua/NAME/plugins
require("lazy").setup({
    import = "mario.plugins",
    change_detection = {
        -- Do not automatically check for config file changes and reload the ui
        enabled = false,
    },
    checker = {
        enabled = true, -- check for plugin updates periodically
        notify = true, -- notify on update
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "tutor",
                "tarPlugin",
                "tohtml",
                "zipPlugin",
            }
        }
    }
})
