{ config, pkgs, ... }:

{
  users.users.toast = {
    isNormalUser = true;
    description = "toast";
    extraGroups = [ "networkmanager" "wheel" "ydotool" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
}
