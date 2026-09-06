{ pkgs, ... }:
let
  unityhub-wrapped = pkgs.symlinkJoin {
    name = "unityhub";
    paths = [ pkgs.unityhub ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/unityhub \
        --prefix PATH : ${pkgs.lib.makeBinPath [ pkgs.python3 pkgs.uv ]}

      sed -i "s|^Exec=.*|Exec=$out/bin/unityhub %U|" $out/share/applications/unityhub.desktop
      sed -i "s|^TryExec=.*|TryExec=$out/bin/unityhub|" $out/share/applications/unityhub.desktop
    '';
  };
in
{
  home.packages = [ unityhub-wrapped ];
}
