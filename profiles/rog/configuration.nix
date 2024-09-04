{ config, pkgs, systemSettings, inputs, ... }:

{
  imports =
    [ ../../system/locale.nix
      ../../system/sound.nix    
      ../../system/nvidia.nix
      ../../system/hardware-configuration.nix      
    ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

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
boot.kernelPackages = pkgs.linuxPackages_testing;

users.users.${systemSettings.username} = {
  isNormalUser = true;
  description = "rfmanz";
  extraGroups = [ "networkmanager" "wheel" "docker" ];
  shell = pkgs.zsh;
};


nixpkgs.config.allowUnfree = true;
programs.zsh.enable = true;
virtualisation.docker.enable = true;

hardware.bluetooth.enable = true;
hardware.bluetooth.powerOnBoot = true;

nix.settings.auto-optimise-store = true;
nix.extraOptions = ''
    experimental-features = nix-command
    '';

system.stateVersion = "24.05"; 

}