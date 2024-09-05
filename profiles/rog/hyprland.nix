{ inputs, pkgs, lib, ... }: {
  options.hyprland = { enable = lib.mkEnableOption "Enable hyprland"; };
  config = {
    home.packages = with pkgs; [
        waybar  
        brightnessctl
        pamixer
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      
      settings = {
        "$mod" = "SUPER"; 
        "$term" = "kitty";    
        monitor = [
          "DP-1,2880x1800@120,0x0,1.5" 
        ];
        env = [
          "XCURSOR_SIZE,32"
          "GDK_SCALE,1.5"
          "QT_AUTO_SCREEN_SCALE_FACTOR,1"
          "QT_SCALE_FACTOR,1.5"
          "WLR_NO_HARDWARE_CURSORS,1"
          "GBM_BACKEND,nvidia-drm"
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          "WLR_DRM_DEVICES,/dev/dri/card1:/dev/dri/card0"
        ];
        
        xwayland = {
          force_zero_scaling = true;
        };

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
        gestures = {
          workspace_swipe = true;
          workspace_swipe_invert = true;
        };
        input = {kb_layout = "us";};
        general = {
          gaps_in = 4;
          gaps_out = 10;
          border_size = 2;
          layout = "dwindle";     
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
        animations = {enabled = false;};

        windowrulev2 = [
          "workspace 1, class:^(Google-chrome)$"        
          "workspace 2, class:^(Code)$,title:^(Visual Studio Code)$"
          "workspace 4, class:^(Spotify)$,title:^(Spotify)$"        
        ];      

        bind = [
          "$mod,RETURN,exec,$term"
          "$mod, Z, exec, rofi -show drun -show-icons"
          "$mod, V, exec, code"
          "$mod, S, exec, spotify"
          "$mod, C, exec, google-chrome-stable"
          "$mod, Y, exec, kitty yazi"
          "$mod, W, killactive"
          "$mod, F, fullscreen"
          "$mod, T, fullscreen,1"
          "$mod, H, movefocus, l"
          "$mod, L, movefocus, r"
          "$mod, K, movefocus, u"
          "$mod, J, movefocus, d"
          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, bracketright, workspace, +1"
          "$mod, bracketleft, workspace, -1"
          "$mod, left,  movewindow, l"
          "$mod, right, movewindow, r"
          "$mod, up,    movewindow, u"
          "$mod, down,  movewindow, d"
          "$mod SHIFT, H, resizeactive, -80 0"
          "$mod SHIFT, L, resizeactive, 80 0"
          "$mod SHIFT, K, resizeactive, 0 -80"
          "$mod SHIFT, J, resizeactive, 0 80"
          "ALT, TAB, cyclenext"
          "ALT, TAB, bringactivetotop"
          "SHIFT ALT, TAB, cyclenext, prev"
          "$mod, equal,  exec, pactl -- set-sink-volume 0 +10%"
          "$mod, minus, exec, pactl -- set-sink-volume 0 -10%"
          # Updated volume control bindings
          ", XF86AudioRaiseVolume, exec, pamixer -i 5"
          ", XF86AudioLowerVolume, exec, pamixer -d 5"
          ", XF86AudioMute, exec, pamixer -t"

          # Keep your existing volume bindings as fallback
          "$mod, equal, exec, pamixer -i 5"
          "$mod, minus, exec, pamixer -d 5"

            # Brightness control bindings
          ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
          ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ", F7, exec, brightnessctl set 5%-"
          ", F8, exec, brightnessctl set 5%+"
        ];     

        exec-once = [
          "waybar"
          "[workspace 1 silent] google-chrome-stable"
          "[workspace 2 silent] code"
          "[workspace 3 silent] kitty"
          "[workspace 4 silent] spotify"
        ];
      };

 
      extraConfig = ''
       exec = sudo chmod +s ${pkgs.brightnessctl}/bin/brightnessctl
        env = WLR_DRM_NO_ATOMIC,1
        env = WLR_RENDERER,vulkan
        env = __NV_PRIME_RENDER_OFFLOAD,1
        env = __VK_LAYER_NV_optimus,NVIDIA_only
      '';
    };
  };
}