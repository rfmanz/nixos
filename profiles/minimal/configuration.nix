{ config, pkgs, systemSettings, ... }:

{
  imports =
    [ ../../system/locale.nix
      ../../system/sound.nix      
      ../../system/hardware-configuration.nix    
      ../../system/greetd.nix  
    ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    
  };

  environment.systemPackages = with pkgs; [
    git
    vscode    
  ];

nix.package = pkgs.nixFlakes;    
nix.settings.experimental-features = [ "nix-command" "flakes" ];
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
networking.hostName = systemSettings.hostname;
networking.networkmanager.enable = true;

users.users.${systemSettings.username} = {
  isNormalUser = true;
  description = "raf";
  extraGroups = [ "networkmanager" "wheel" ];
  shell = pkgs.zsh;
};

nixpkgs.config.allowUnfree = true;
programs.zsh.enable = true;

hardware.bluetooth.enable = true;
hardware.bluetooth.powerOnBoot = true;

nix.settings.auto-optimise-store = true;

system.stateVersion = "24.05"; 

}