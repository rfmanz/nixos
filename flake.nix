{
  description = "esta flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };    
    hyprland.url = "github:hyprwm/Hyprland";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: 
    let
      systemSettings = {
        profile = "minimal"; # !! SET !!
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
        system = systemSettings.system;
          modules = [        
            (./. + "/profiles" + ("/" + systemSettings.profile)
              + "/configuration.nix")
            { programs.hyprland.enable = true; }
            { programs.sway.enable = true; }
          ]; 
          specialArgs = {
            inherit systemSettings;
            inherit inputs;
          };
        };
      };
      homeConfigurations = {
        "rfmanz@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${systemSettings.system};
          modules = [(./. + "/profiles" + ("/" + systemSettings.profile)
              + "/home.nix")       
          ];
          extraSpecialArgs = { 
            inherit inputs;
            inherit systemSettings; 
          };         
        };
      };
    };
}