{ pkgs, ...}:

{
  home.packages = with pkgs; [
    lsof
  ];
  programs.nixvim = {
    plugins.opencode = {
      enable = true;
      settings = {
        auto_reload = true;
      };
    };
    opts.autoread = true;
  };
}
