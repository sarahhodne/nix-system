require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremenetal = "grm",
    },
  },
  indent = {
    enable = true,
  },
}

vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
