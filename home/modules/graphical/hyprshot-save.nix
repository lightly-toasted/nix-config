{ config, pkgs, ... }:

{
  sops.secrets."zipline/token" = { };
  home.packages = [
    (pkgs.writeShellScriptBin "hyprshot-save" ''
      export HYPRSHOT_DIR=/data/Backup/Screenshots/

      NO_UPLOAD=false
      DELETE=false

      for arg in "$@"; do
        case "$arg" in
          --no-upload) NO_UPLOAD=true ;;
          --delete)    DELETE=true ;;
        esac
      done

      if [ "$NO_UPLOAD" = true ]; then
        ${pkgs.hyprshot}/bin/hyprshot -m region
        exit 0
      fi

      tmpfile=$(mktemp --suffix=".png")
      ${pkgs.hyprshot}/bin/hyprshot -m region -o "$(dirname "$tmpfile")" -f "$(basename "$tmpfile")"

      token=$(cat ${config.sops.secrets."zipline/token".path})

      url=$(curl -s \
        -H "authorization: $token" \
        -H "content-type: multipart/form-data" \
        -F "file=@$tmpfile;type=image/png" \
        https://i.toast.name/api/upload \
        | ${pkgs.jq}/bin/jq -r '.files[0].url')

      wl-copy <<< "$url"
      notify-send "hyprshot-save" "URL copied to clipboard:\n$url"

      if [ "$DELETE" = true ]; then
        rm -f "$tmpfile"
        echo "Deleted temporary screenshot: $tmpfile"
      fi
    '')
  ];
}

