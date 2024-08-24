{ config, pkgs, inputs, systemSettings, ... }:

{
  home.username = "rfmanz";
  home.homeDirectory = "/home/rfmanz";
  home.stateVersion = "24.05";
  nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
	};
  imports = [
    # ./modules
  vscode
hyprland
yazi
waybar
rofi-wayland
neofetch
git
vlc
spotify
asciiquarium
google-chrome
btop
zathura  
  ];
  programs.home-manager.enable = true;
}

