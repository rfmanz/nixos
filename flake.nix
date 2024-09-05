{
  description = "esta flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };    
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    hyprcursor = {
      url = "github:hyprwm/hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, hyprland, hyprwm-contrib, hyprcursor, ... }@inputs: 
    let
      systemSettings = {
        profile = "rog"; # !! SET !!
        system = "x86_64-linux";
        hostname = "nixos";        
        username = "raf";         
        timezone = "America/Lima";
        locale = "en_US.UTF-8";              
      };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = systemSettings.system;
          modules = [        
            (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
            hyprland.nixosModules.default
            { programs.hyprland.enable = true; }
            # Removed Sway to avoid conflicts
          ]; 
          specialArgs = {
            inherit systemSettings;
            inherit inputs;
          };
        };
      };
      homeConfigurations = {
        "${systemSettings.username}" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${systemSettings.system};
          modules = [
            (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")       
          ];
          extraSpecialArgs = { 
            inherit inputs;
            inherit systemSettings; 
          };         
        };
      };
    };
}