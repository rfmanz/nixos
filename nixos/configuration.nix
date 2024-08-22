{ config, pkgs, systemSettings, ... }:

{
  imports =
    [ ./locale.nix
      ./nvidia.nix
      ./sound.nix      
      ./hardware-configuration.nix 
    ];
nix.package = pkgs.nixFlakes;    
nix.settings.experimental-features = [ "nix-command" "flakes" ];
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
networking.hostName = systemSettings.hostname;
networking.networkmanager.enable = true;

hardware.opengl = {
  enable = true;
  driSupport = true;
  driSupport32Bit = true;
};

users.users.${systemSettings.username} = {
  isNormalUser = true;
  description = userSettings.name;
  extraGroups = [ "networkmanager" "wheel" "docker" ];
  shell = pkgs.zsh;
};

  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  virtualisation.docker.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  nix.settings.auto-optimise-store = true;

  environment.systemPackages = with pkgs; [ git vscode ];

  system.stateVersion = "24.05"; 

}