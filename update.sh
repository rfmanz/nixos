#!/bin/bash

# Run the NixOS system rebuild
sudo nixos-rebuild switch --flake .

# Run the Home Manager switch
home-manager switch --flake .