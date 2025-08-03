{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.ayu.enable = true;
  };

  imports = [
    ./plugins/bufferline.nix
    ./plugins/lualine.nix
  ];
}
