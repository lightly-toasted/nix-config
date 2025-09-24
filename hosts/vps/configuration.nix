{ inputs, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ] ++ (
      let
        modulesPath = ./modules;
        moduleFiles = builtins.attrNames (builtins.readDir modulesPath);
      in
        map (module: modulesPath + ("/" + module)) moduleFiles
  );
  
  system.stateVersion = "23.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
