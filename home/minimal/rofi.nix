{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      display-drun = "Activate";
      display-run = "Execute";
      show-icons = true;
      sidebar-mode = true;
    };
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "*" = {
        background-color = mkLiteral "rgb(18, 30, 37)";
        text-color = mkLiteral "#d3d7cf";
        selbg = mkLiteral "rgb(0, 86, 136)";
        actbg = mkLiteral "rgb(22, 37, 46)";
        urgbg = mkLiteral "#e53935";
        winbg = mkLiteral "#26c6da";

        selected-normal-foreground = mkLiteral "@winbg";
        normal-foreground = mkLiteral "@text-color";
        selected-normal-background = mkLiteral "@actbg";
        normal-background = mkLiteral "@background-color";

        selected-urgent-foreground = mkLiteral "@background-color";
        urgent-foreground = mkLiteral "@text-color";
        selected-urgent-background = mkLiteral "@urgbg";
        urgent-background = mkLiteral "@background-color";

        selected-active-foreground = mkLiteral "@winbg";
        active-foreground = mkLiteral "@text-color";
        selected-active-background = mkLiteral "@actbg";
        active-background = mkLiteral "@selbg";

        line-margin = 2;
        line-padding = 2;
        separator-style = "none";
        hide-scrollbar = true;
        margin = 0;
        padding = 0;
        font = "Roboto medium 10";
      };

      "window" = {
        location = mkLiteral "west";
        anchor = mkLiteral "west";
        x-offset = 0;
        height = mkLiteral "100%";
        margin-right = 60;
        orientation = "horizontal";
        children = mkLiteral "[mainbox]";
      };

      "mainbox" = {
        spacing = mkLiteral "0em";
        padding = 0;
        width = 200;
        children = mkLiteral "[ inputbar, listview, sidebar ]";
        expand = true;
      };

      "button" = {
        padding = mkLiteral "5px 2px";
      };

      "button selected" = {
        background-color = mkLiteral "@active-background";
        text-color = mkLiteral "@background-color";
      };

      "inputbar" = {
        children = mkLiteral "[ entry ]";
      };

      "textbox-prompt-colon" = {
        text-color = "inherit";
        expand = false;
        margin = mkLiteral "0 0.3em 0em 0em";
      };

      "listview" = {
        spacing = mkLiteral "0em";
        dynamic = false;
        cycle = true;
      };

      "element" = {
        padding = 16;
        border = mkLiteral "0 0 0 5px solid";
      };

      "entry" = {
        expand = true;
        text-color = mkLiteral "@normal-foreground";
        background-color = mkLiteral "rgb(25, 41, 51)";
        vertical-align = mkLiteral "1";
        padding = 12;
        font = "Roboto medium 13";
      };

      "element normal.normal" = {
        background-color = mkLiteral "@normal-background";
        text-color = mkLiteral "@normal-foreground";
      };

      "element normal.urgent" = {
        background-color = mkLiteral "@urgent-background";
        text-color = mkLiteral "@urgent-foreground";
      };

      "element normal.active" = {
        background-color = mkLiteral "@active-background";
        text-color = mkLiteral "@active-foreground";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@selected-normal-background";
        text-color = mkLiteral "@selected-normal-foreground";
        padding = 16;
        border = mkLiteral "0 0 0 5px solid";
        border-color = mkLiteral "@active-background";
      };

      "element selected.urgent" = {
        background-color = mkLiteral "@selected-urgent-background";
        text-color = mkLiteral "@selected-urgent-foreground";
      };

      "element selected.active" = {
        background-color = mkLiteral "@selected-active-background";
        text-color = mkLiteral "@selected-active-foreground";
      };

      "element alternate.normal" = {
        background-color = mkLiteral "@normal-background";
        text-color = mkLiteral "@normal-foreground";
      };

      "element alternate.urgent" = {
        background-color = mkLiteral "@urgent-background";
        text-color = mkLiteral "@urgent-foreground";
      };

      "element alternate.active" = {
        background-color = mkLiteral "@active-background";
        text-color = mkLiteral "@active-foreground";
      };
    };
  };
}