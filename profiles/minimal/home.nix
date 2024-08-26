{ config, pkgs, inputs, systemSettings, ... }:

{
  home.username = "rfmanz";
  home.homeDirectory = "/home/rfmanz";
  home.stateVersion = "24.11";
  nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
	};
  imports = [
      # ../../home/minimal      
      ./hyprland.nix
      ./rofi.nix
      ./waybar.nix
  ];

home.packages = with pkgs; [
vscode
hyprland
yazi
bash
waybar
rofi-wayland
neofetch
git
vlc
asciiquarium
google-chrome
btop
pywal
  ];
  programs.home-manager.enable = true;
}

