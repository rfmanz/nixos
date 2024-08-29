# install

export NIXPKGS_ALLOW_UNFREE=1  

nix-shell -p git vscode

sudo cp /etc/nixos/hardware_config ./nixos/ 

 home-manager switch --flake .#rfmanz 

sudo nixos-rebuild switch --flake .

home-manager switch --flake .

nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
nix-channel --update

sudo nix-channel --update
sudo nix flake update

    modify `profile` in flake.nix if needed. default is minimal.

    if more that one username: `sudo nixos-rebuild switch --flake ".#nixos" `

    `nix-collect-garbage`    


nix-shell -p 'python3.withPackages(ps: with ps; [ pip virtualenv ])'

nix-env -iA nixpkgs.python3.withPackages(ps: with ps; [ pip virtualenv ])

Create a virtual environment

virtualenv myenv

Activate the virtual environment

source myenv/bin/activate

Now you can install packages without the read-only file system error

pip install <package_name>


  
cursors: in vscode cursor is ugly 

starship 

make media keys work 

# notes

**structure:**

- system: -> this is stuff that is installed on a system wide level
 
- profiles:
    - minimal 
        - configuration.nix
        - home.nix -> this home.nix will be base imports for more involved home.nixs. i.e: https://gitlab.com/librephoenix/nixos-config/-/blob/main/profiles/work/home.nix?ref_type=heads
    - rog 
        - configuration.nix
        - home.nix

TODO 

- modify flake to point to profile 
- hyprland config. because if not we're useless on first login. maybe two hypr configs. no animations for minimal 

kill waybar 

pywal for theme change 

zsh  + starship 

---
**packages to consider:** 

- R
- Cursor 
- qbitorrent 

vscode config  & keyboard shortcuts 


open spotify, chrome, vscode on login. 

swipe to change kinda like this: https://github.com/material-shell/material-shell?tab=readme-ov-file#spatial-model 

then hotkeys for these apps + terminal 


# resources

https://codeberg.org/justgivemeaname/.dotfiles.git

https://codeberg.org/brunoc/nixos-files
