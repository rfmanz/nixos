{ inputs, pkgs, lib, ... }: {
  options.hyprland = { enable = lib.mkEnableOption "Enable hyprland"; };
  config = {

    home.packages = with pkgs; [
        waybar
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER"; 
        "$term" = "kitty";    
        monitor = [ ",preferred, auto, auto" ];
        decoration = {
          rounding = 2;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          fullscreen_opacity = 1.0;
          drop_shadow = false;
          shadow_range = 4;
          shadow_render_power = 3;
          shadow_ignore_window = true;
          dim_inactive = false;
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            new_optimizations = true;
            xray = true;
            ignore_opacity = false;
          };
        };
        gestures = {workspace_swipe = true;};
        general = {
          gaps_in = 4;
          gaps_out = 10;
          border_size = 2;
          layout = "dwindle"; # master|dwindle ;      
        };
        misc = {
          disable_autoreload = true;
          disable_hyprland_logo = true;
          always_follow_on_dnd = true;
          layers_hog_keyboard_focus = true;
          animate_manual_resizes = false;
          enable_swallow = true;
          swallow_regex = "";
          focus_on_activate = true;
        };


        windowrulev2 = [
        "workspace 1, class:^(google-chrome)$"
        "workspace 2, class:^(vscode)$"
        "workspace 3, class:^(spotify)$"        
        ];

        bind = [
         #terminal
        "$mod,RETURN,exec,$term"
        "$mod, Z, exec, rofi -show drun -show-icons"

        #window actions 
        "$mod, Q, killactive                                            # Close window"
        "$mod, F, fullscreen                                            # Toggle fullscreen"
        "$mod, T, fullscreen,1                                           # maximize window"
        "$mod, H, movefocus, l                                          # Focus left"
        "$mod, L, movefocus, r                                          # Focus right"
        "$mod, K, movefocus, u                                          # Focus up"
        "$mod, J, movefocus, d                                         # Focus down"     

          # workspace
        "$mod, 1, workspace, 1                                          # Switch to workspace 1"
        "$mod, 2, workspace, 2                                          # Switch to workspace 2"
        "$mod, 3, workspace, 3                                          # Switch to workspace 3"
        "$mod, 4, workspace, 4                                          # Switch to workspace 4"
        "$mod, bracketright, workspace, +1                              # Switch to next workspace"
        "$mod, bracketleft, workspace, -1                               # Switch to previous workspace"

        # move windwos 
        "$mod, left,  movewindow, l                                     # Move window left"
        "$mod, right, movewindow, r                                     # Move window right"
        "$mod, up,    movewindow, u                                     # Move window up"
        "$mod, down,  movewindow, d                                     # Move window down"
        # resize windows
        "$mod SHIFT, H, resizeactive, -80 0                             # Resize window left"
        "$mod SHIFT, L, resizeactive, 80 0                              # Resize window right"
        "$mod SHIFT, K, resizeactive, 0 -80                             # Resize window up"
        "$mod SHIFT, J, resizeactive, 0 80                              # Resize window down"    
        
        "ALT, TAB, cyclenext                                            # Cycle through windows"
        "ALT, TAB, bringactivetotop                                     # Bring window to top"
        "SHIFT ALT, TAB, cyclenext, prev                                # Cycle through windows backwards"      
       
      
        # volume control
        ",XF86AudioRaiseVolume,exec, volumectl -u up"
        ",XF86AudioLowerVolume,exec,  volumectl -u down "
        ",XF86AudioMute,exec,  volumectl toggle-mute "

        # music control bindings
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ", XF86AudioStop, exec, playerctl stop"
        ];     


        exec-once = [
          "waybar"
          "spotify"
          "google-chrome"
          "vscode"
        ];
      };
    };
  };
}




