let
  authorizedKeys = [
    ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOyVXtny3ca64wdJAwcUro+U4sY4r6v97ypIXdedOuhc toast@nixos'' 
    ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ8finfQLaXSqxB16XjsVogN8NRAkNj3Un7JTXlLiLYj u0_a173@localhost''
    ''ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOiWeuDQdMc7EUT60GAg18t6dOQrIFok0HcbuZSBP+9o android@y2q''
  ];
in
{
  users.users.toast = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = authorizedKeys;
  };
  users.users.root.openssh.authorizedKeys.keys = authorizedKeys;
}
