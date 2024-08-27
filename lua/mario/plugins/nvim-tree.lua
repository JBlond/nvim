return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
     -- nice Icons
    'kyazdani42/nvim-web-devicons',
	'echasnovski/mini.nvim'
  },
  config = function()
    require('nvim-tree').setup({
      view = {
        width = 40,
      },
    })

    -- sf - show files
    vim.keymap.set("n", "<leader>sf", ":NvimTreeToggle<CR>")

    -- jump (to) file, then center (zz)
    vim.keymap.set("n", "<leader>jf", ":NvimTreeFindFile<CR>zz")
  end
}
