{ config, pkgs, inputs, systemSettings, ... }:

{
  home.username = "raf";
  home.homeDirectory = "/home/raf";
  home.stateVersion = "24.05";
  home.enableNixpkgsReleaseCheck = false;
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
      # ./everforest_rofi.nix
      ./waybar.nix
  ];

home.packages = with pkgs; [
vscode
hyprland
yazi
kitty
waybar
rofi-wayland
neofetch
git
asciiquarium
google-chrome
btop
spotify
pamixer   
brightnessctl 
  ];
  programs.home-manager.enable = true;
}

