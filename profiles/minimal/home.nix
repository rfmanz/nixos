{ config, pkgs, inputs, systemSettings, ... }:

{
  home.username = "rfmanz";
  home.homeDirectory = "/home/rfmanz";
  home.stateVersion = "24.05";
  # home.enableNixpkgsReleaseCheck = false;
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
kitty
waybar
rofi-wayland
neofetch
git
vlc
asciiquarium
google-chrome
btop
pywal
spotify
  ];
  programs.home-manager.enable = true;
}

