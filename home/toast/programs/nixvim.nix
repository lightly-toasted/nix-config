{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.ayu.enable = true;
    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
    };
  };
}
