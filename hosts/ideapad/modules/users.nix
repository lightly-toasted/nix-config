{ config, pkgs, ... }:

{
  users.users.toast = {
    isNormalUser = true;
    description = "toast";
    extraGroups = [ "networkmanager" "wheel" "ydotool" ];
    openssh.authorizedKeys.keys = [
      ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOyVXtny3ca64wdJAwcUro+U4sY4r6v97ypIXdedOuhc toast@nixos'' 
      ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ8finfQLaXSqxB16XjsVogN8NRAkNj3Un7JTXlLiLYj u0_a173@localhost''
      ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOoq1IqrOJ0AAmWRsX0ULiQioEPH9Xo30nwBlrODkude u0_a299@localhost''
    ];
    shell = pkgs.zsh;
  };
}
