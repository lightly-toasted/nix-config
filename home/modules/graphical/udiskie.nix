{ pkgs, ... }:

{
  services.udiskie = {
    enable = true;
    settings = {
      programs_options = {
        file_manager = "${pkgs.xfce.thunar}/bin/thunar";
      };
    };
  };
}
