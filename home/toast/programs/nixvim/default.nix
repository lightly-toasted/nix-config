{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.ayu.enable = true;
  };

  imports = [
    ./plugins/bufferline.nix
    ./plugins/lualine.nix
    ./plugins/cmp.nix
    ./plugins/comment.nix
    ./plugins/colorizer.nix
    ./plugins/nvim-autopairs.nix
    ./plugins/gitsigns.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/nvim-tree.nix
    ./plugins/web-devicons.nix
    ./plugins/wakatime.nix
    ./plugins/which-key.nix
  ];
}
