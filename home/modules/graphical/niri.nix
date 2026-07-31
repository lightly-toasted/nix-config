{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      prefer-no-csd = true;
      input = {
        keyboard.xkb = {
          layout = "us,kr";
          options = "grp:alt_shift_toggle";
        };
        mouse = {
          accel-speed = -0.6;
        };
        focus-follows-mouse.enable = true;
        warp-mouse-to-focus = {
          enable = true;
          mode = "center-xy";
        };
      };

      layout = {
        gaps = 12;
        focus-ring = {
          width = 2;
          active = { color = "#fff"; };
          inactive = { color = "#595959"; };
        };
        shadow = {
          softness = 4;
          color = "#1a1a1aee";
        };
        background-color = "#000";
      };

      environment = {
        LIBVA_DRIVER_NAME = "nvidia";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        QT_QPA_PLATFORM = "wayland";
        GTK_IM_MODULE = "kime";
        QT_IM_MODULE = "kime";
        XMODIFIERS = "@im=kime";
      };

      spawn-at-startup = [
        { argv = [ "waybar" ]; }
        { argv = [ "firefox" ]; }
      ];

      screenshot-path = "/data/Backup/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      window-rules = [
        {
          matches = [ { app-id = "^firefox$"; title = "^Picture-in-Picture$"; } ];
          open-floating = true;
        }
        {
          geometry-corner-radius = {
            top-left = 10.0;
            top-right = 10.0;
            bottom-left = 10.0;
            bottom-right = 10.0;
          };
          clip-to-geometry = true;
        }
      ];

      binds = {
        "Mod+Q".action.spawn = "kitty";
        "Mod+C".action.close-window = [];
        "Mod+E".action.spawn = "thunar";
        "Mod+R".action.spawn = ["tofi-drun" "--drun-launch=true"];

        "Mod+H".action.focus-column-or-monitor-left = []; 
        "Mod+J".action.focus-window-or-workspace-down = [];
        "Mod+K".action.focus-window-or-workspace-up = [];
        "Mod+L".action.focus-column-or-monitor-right = [];

        "Mod+Shift+H".action.move-column-left-or-to-monitor-left = [];
        "Mod+Shift+J".action.move-window-down = [];
        "Mod+Shift+K".action.move-window-up = [];
        "Mod+Shift+L".action.move-column-right-or-to-monitor-right = [];

        "Mod+Alt+H".action.set-column-width = "-10%";
        "Mod+Alt+J".action.set-window-height = "+10%";
        "Mod+Alt+K".action.set-window-height = "-10%";
        "Mod+Alt+L".action.set-column-width = "+10%";

        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;
        "Mod+0".action.focus-workspace = 10;

        "Mod+Ctrl+1".action.move-column-to-workspace = 1;
        "Mod+Ctrl+2".action.move-column-to-workspace = 2;
        "Mod+Ctrl+3".action.move-column-to-workspace = 3;
        "Mod+Ctrl+4".action.move-column-to-workspace = 4;
        "Mod+Ctrl+5".action.move-column-to-workspace = 5;
        "Mod+Ctrl+6".action.move-column-to-workspace = 6;
        "Mod+Ctrl+7".action.move-column-to-workspace = 7;
        "Mod+Ctrl+8".action.move-column-to-workspace = 8;
        "Mod+Ctrl+9".action.move-column-to-workspace = 9;
        "Mod+Ctrl+0".action.move-column-to-workspace = 10;

        "Mod+F".action.maximize-column = [];
        "Mod+Shift+F".action.fullscreen-window = [];
        "Mod+Shift+V".action.toggle-window-floating = [];

        "Mod+S".action.screenshot = [];
        "Mod+Shift+S".action.spawn-sh = "hyprshot-save";

        "Mod+V".action.spawn-sh = "cliphist list | tofi | cliphist decode | wl-copy";

        "Mod+Shift+E".action.spawn = "powermenu";

        "XF86AudioRaiseVolume" = { allow-when-locked = true; action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.0"; };
        "XF86AudioLowerVolume" = { allow-when-locked = true; action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"; };
        "XF86AudioMute" = { allow-when-locked = true; action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; };
        "XF86AudioMicMute" = { allow-when-locked = true; action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; };

        "XF86AudioPlay" = { allow-when-locked = true; action.spawn-sh = "playerctl play-pause"; };
        "XF86AudioPause" = { allow-when-locked = true; action.spawn-sh = "playerctl play-pause"; };
        "XF86AudioNext" = { allow-when-locked = true; action.spawn-sh = "playerctl next"; };
        "XF86AudioPrev" = { allow-when-locked = true; action.spawn-sh = "playerctl previous"; };

        "Mod+End".action.spawn = "cycle-mouse-action";
        "End".action.spawn = "run-mouse-action";

      };
    };
  };
  home.pointerCursor = {
    enable = true;
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 24;

    gtk.enable = true;
    x11.enable = true;
  };
}
