{ pkgs, ... }:

{
  home.packages = with pkgs; [
    minecraft
  ];
}

