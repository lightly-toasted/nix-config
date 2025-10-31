{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.moonfly = {
      enable = true;
    };
    opts = {
      number = true;
      relativenumber = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
    };
  };

  imports = [
    ./keymaps.nix
  ] ++ (
      let
        pluginsPath = ./plugins;
        pluginFiles = builtins.attrNames (builtins.readDir pluginsPath);
      in
        map (module: pluginsPath + ("/" + module)) pluginFiles
    );
}
