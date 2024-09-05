{ config, pkgs, systemSettings, inputs, ... }:

{
  imports = [
    ../../system/locale.nix
    ../../system/sound.nix
    ../../system/nvidia.nix
    ../../system/hardware-configuration.nix
  ];

  # Hyprland configuration
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # Consider removing this line if using the module from the flake
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    git
    vscode
  ];

  # Nix configuration
  nix = {
    package = pkgs.nixFlakes;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    # Removed redundant extraOptions
  };

  # Boot configuration
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_testing;
  };

  # Networking
  networking = {
    hostName = systemSettings.hostname;
    networkmanager.enable = true;
  };

  # User configuration
  users.users.${systemSettings.username} = {
    isNormalUser = true;
    description = "rfmanz";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  # System configuration
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  virtualisation.docker.enable = true;

  # Hardware configuration
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Consider updating this to match your nixpkgs input in the flake
  system.stateVersion = "24.05";
}