https://codeberg.org/justgivemeaname/.dotfiles.git

https://codeberg.org/brunoc/nixos-files

so the sequence for a new build is the following: 

1. you install nixos with the usb stick. 
2. nix-shell git vscode
3. git clone the repo 
4. but then you have to modify:

    - copy the auto generated hardware config 
    - then lets say you have two profiles: main & minimal | set this install to either of them 
    - but to set up profiles you need to reconfigure configuration.nix quite a lot 

    - first setup minimal and then use nix-shell for aditional stuff 


Packages to consider: 

- R
- Cursor 
- qbitorrent 


open spotify, chrome, vscode on login. 

swipe to change kinda like this: https://github.com/material-shell/material-shell?tab=readme-ov-file#spatial-model 

then hotkeys for these apps + terminal 

       error: attribute 'environment.systemPackages' already defined at /nix/store/rq3nhqzcadkr2m31nyjqrsc8663brnfs-source/nixos/configuration.nix:17:3