{
  description = "esta flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprwm-contrib.url = "github:hyprwm/contrib";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, hyprland, ... }@inputs: 
    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "nixos";
        username = "rfmanz";         
        timezone = "America/Lima";
        locale = "en_US.UTF-8";              
      };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit (systemSettings) system;
          specialArgs = { inherit systemSettings inputs; };             
          modules = [
            ./nixos/configuration.nix
            catppuccin.nixosModules.catppuccin
            hyprland.nixosModules.default
            { programs.hyprland.enable = true; }
            { programs.sway.enable = true; }
          ];
        };
      };
      homeConfigurations = {
        "rfmanz@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${systemSettings.system};
          modules = [
            ./home/home.nix 
            catppuccin.homeManagerModules.catppuccin
          ];
          extraSpecialArgs = { 
            inherit inputs;
            # inherit systemSettings; 
          };         
        };
      };
    };
}