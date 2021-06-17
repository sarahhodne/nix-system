{ lib, ... }: {
  imports = [
    ./bash
    ./fzf
    ./go-lsp
    ./json
    ./lspsaga-nvim
    ./lualine-nvim
    ./nvim-autopairs
    ./nvim-compe
    ./nvim-lspconfig
    ./rnix-lsp
    ./terraform-lsp
    ./vim-terraform
    ./theme
    ./treesitter
    ./yaml-lsp
  ];
}
