return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
     -- für schönere Icons
    'kyazdani42/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup({
      view = {
        width = 40,
      },
    })

    -- Beispiel mit sf - show files
    vim.keymap.set("n", "<leader>sf", ":NvimTreeToggle<CR>")

    -- Zur Datei springen (jump file), danach zentrieren (zz)
    vim.keymap.set("n", "<leader>jf", ":NvimTreeFindFile<CR>zz")
  end
}
