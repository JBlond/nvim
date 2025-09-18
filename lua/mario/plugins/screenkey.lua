return {
    "NStefan002/screenkey.nvim",
    version = "*", -- or branch = "dev", to use the latest commit
    cmd = { "Screenkey" },
    config = function()
        require("screenkey").setup {
            keys = {
                ["<TAB>"] = "Tab",
                ["<CR>"] = "return",
                ["<SPACE>"] = "Space",
                ["<BS>"] = "<-",
                ["<DEL>"] = "Del",
                ["<LEFT>"] = "Left",
                ["<RIGHT>"] = "Right",
                ["<UP>"] = "Up",
                ["<DOWN>"] = "Down",
                ["<F1>"] = "F1",
                ["<F2>"] = "F2",
                ["<F3>"] = "F3",
                ["<F4>"] = "F4",
                ["<F5>"] = "F5",
                ["<F6>"] = "F6",
                ["<F7>"] = "F7",
                ["<F8>"] = "F8",
                ["<F9>"] = "F9",
                ["<F10>"] = "F10",
                ["<F11>"] = "F11",
                ["<F12>"] = "F12",
                ["SUPER"] = "Super",
            },
        }
    end
}
