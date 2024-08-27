{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "drun,run,filebrowser";
      show-icons = true;
      display-drun = "APPS";
      display-run = "RUN";
      display-filebrowser = "FILES";
      drun-display-format = "{name}";
    };
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        font = "CaskaydiaCove Nerd Font 10";
        background = mkLiteral "#272E33";
        background-alt = mkLiteral "#2E383C";
        foreground = mkLiteral "#D3C6AA";
        selected = mkLiteral "#A7C080";
        active = mkLiteral "#A7C080";
        urgent = mkLiteral "#374145";
      };

      "window" = {
        transparency = mkLiteral "real";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        fullscreen = false;
        width = mkLiteral "1000px";
        x-offset = 0;
        y-offset = 0;
        enabled = true;
        border-radius = 15;
        cursor = mkLiteral "default";
        background-color = mkLiteral "@background";
      };

      "mainbox" = {
        enabled = true;
        spacing = 0;
        background-color = mkLiteral "transparent";
        orientation = mkLiteral "horizontal";
        children = mkLiteral "[imagebox, listbox]";
      };

      "imagebox" = {
        padding = 20;
        background-color = mkLiteral "transparent";
        background-image = mkLiteral "url('./Garden.png', height)";
        orientation = mkLiteral "vertical";
        children = mkLiteral "[inputbar, dummy, mode-switcher]";
      };

      "listbox" = {
        spacing = 20;
        padding = 20;
        background-color = mkLiteral "transparent";
        orientation = mkLiteral "vertical";
        children = mkLiteral "[message, listview]";
      };

      "dummy" = {
        background-color = mkLiteral "transparent";
      };

      "inputbar" = {
        enabled = true;
        spacing = 10;
        padding = 15;
        border-radius = 10;
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
        children = mkLiteral "[textbox-prompt-colon, entry]";
      };

      "textbox-prompt-colon" = {
        enabled = true;
        expand = false;
        str = mkLiteral " ";
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "entry" = {
        enabled = true;
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "text";
        placeholder = mkLiteral "Search";
        placeholder-color = mkLiteral "inherit";
      };

      "mode-switcher" = {
        enabled = true;
        spacing = 20;
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
      };

      "button" = {
        padding = 15;
        border-radius = 10;
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "pointer";
      };

      "button selected" = {
        background-color = mkLiteral "@selected";
        text-color = mkLiteral "#2E383C";
      };

      "listview" = {
        enabled = true;
        columns = 1;
        lines = 8;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;
        spacing = 10;
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = mkLiteral "default";
      };

      "element" = {
        enabled = true;
        spacing = 15;
        padding = 8;
        border-radius = 10;
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = mkLiteral "pointer";
      };

      "element normal.normal" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "element normal.urgent" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@foreground";
      };

      "element normal.active" = {
        background-color = mkLiteral "@active";
        text-color = mkLiteral "#2E383C";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@selected";
        text-color = mkLiteral "#2E383C";
      };

      "element selected.urgent" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@foreground";
      };

      "element selected.active" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@foreground";
      };

      "element-icon" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = 32;
        cursor = mkLiteral "inherit";
      };

      "message" = {
        background-color = mkLiteral "transparent";
      };

      "textbox" = {
        padding = 15;
        border-radius = 10;
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
        vertical-align = 0.5;
        horizontal-align = mkLiteral "0.0";
      };

      "error-message" = {
        padding = 15;
        border-radius = 20;
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      };
    };
  };
}
