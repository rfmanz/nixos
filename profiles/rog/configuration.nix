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

  # NVIDIA configuration
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      # Corrected Bus IDs based on lshw output
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:101:0:0";
    };
  };

  # OpenGL configuration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Wayland and graphics configuration
  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];

  environment.sessionVariables = {
    XCURSOR_SIZE = "32";
    GDK_SCALE = "1.5";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_SCALE_FACTOR = "1.5";
  };

  # Improve font rendering
  fonts.fontconfig = {
    enable = true;
    antialias = true;
    hinting = {
      enable = true;
      style = "slight";
    };
    subpixel.rgba = "rgb";
  };

  system.stateVersion = "24.05";
}