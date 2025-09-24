{
  users.users.toast = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [ ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOyVXtny3ca64wdJAwcUro+U4sY4r6v97ypIXdedOuhc toast@nixos'' ];
  };
  users.users.root.openssh.authorizedKeys.keys = [''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOyVXtny3ca64wdJAwcUro+U4sY4r6v97ypIXdedOuhc toast@nixos'' ];
}
