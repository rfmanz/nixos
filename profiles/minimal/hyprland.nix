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
          rounding = 0;
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
        bind = [
         #terminal
         "$mod,t,exec,$term"

        "$mod, Z, exec, rofi -show drun -show-icons"

          # workspace

        "$mod, 1, workspace, 1                                          # Switch to workspace 1"
        "$mod, 2, workspace, 2                                          # Switch to workspace 2"
        "$mod, 3, workspace, 3                                          # Switch to workspace 3"
        "$mod, 4, workspace, 4                                          # Switch to workspace 4"
        "$mod, 5, workspace, 5                                          # Switch to workspace 5"
        "$mod, 6, workspace, 6                                          # Switch to workspace 6"
        "$mod, 7, workspace, 7                                          # Switch to workspace 7"
        "$mod, 8, workspace, 8                                          # Switch to workspace 8"
        "$mod, 9, workspace, 9                                          # Switch to workspace 9"
        "$mod, 0, workspace, 10                                         # Switch to workspace 10"
        "$mod SHIFT, 1, movetoworkspace, 1                              # Move window to workspace 1"
        "$mod SHIFT, 2, movetoworkspace, 2                              # Move window to workspace 2"
        "$mod SHIFT, 3, movetoworkspace, 3                              # Move window to workspace 3"
        "$mod SHIFT, 4, movetoworkspace, 4                              # Move window to workspace 4"
        "$mod SHIFT, 5, movetoworkspace, 5                              # Move window to workspace 5"
        "$mod SHIFT, 6, movetoworkspace, 6                              # Move window to workspace 6"
        "$mod SHIFT, 7, movetoworkspace, 7                              # Move window to workspace 7"
        "$mod SHIFT, 8, movetoworkspace, 8                              # Move window to workspace 8"
        "$mod SHIFT, 9, movetoworkspace, 9                              # Move window to workspace 9"
        "$mod SHIFT, 0, movetoworkspace, 10                             # Move window to workspace 10"
        "$mod, left,  movewindow, l                                     # Move window left"
        "$mod, right, movewindow, r                                     # Move window right"
        "$mod, up,    movewindow, u                                     # Move window up"
        "$mod, down,  movewindow, d                                     # Move window down"
        "$mod SHIFT, H, resizeactive, -80 0                             # Resize window left"
        "$mod SHIFT, L, resizeactive, 80 0                              # Resize window right"
        "$mod SHIFT, K, resizeactive, 0 -80                             # Resize window up"
        "$mod SHIFT, J, resizeactive, 0 80                              # Resize window down"        
        "$mod, bracketright, workspace, +1                              # Switch to next workspace"
        "$mod, bracketleft, workspace, -1                               # Switch to previous workspace"
        "ALT, TAB, cyclenext                                            # Cycle through windows"
        "ALT, TAB, bringactivetotop                                     # Bring window to top"
        "SHIFT ALT, TAB, cyclenext, prev                                # Cycle through windows backwards"
        "$mod, Q, killactive                                            # Close window"
        "$mod, F, fullscreen                                            # Toggle fullscreen"
        "$mod, H, movefocus, l                                          # Focus left"
        "$mod, L, movefocus, r                                          # Focus right"
        "$mod, K, movefocus, u                                          # Focus up"
        "$mod, J, movefocus, d                                         # Focus down"           
       

        # volume control
        ",XF86AudioRaiseVolume,exec, pamixer -i 5"
        ",XF86AudioLowerVolume,exec, pamixer -d 5"
        ",XF86AudioMute,exec, pamixer -t"

        # music control bindings
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ", XF86AudioStop, exec, playerctl stop"
        ];

        bindm =
          [ "$mod,mouse:272,movewindow" "$mod,mouse:273,resizewindow" ];

        exec-once = [
          "waybar"
        ];
      };
    };
  };
}