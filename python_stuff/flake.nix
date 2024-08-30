{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs @ { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      envWithScript = script:
        (pkgs.buildFHSUserEnv {
          name = "python-env";
          targetPkgs = pkgs: (with pkgs; [
            python39
            python39Packages.pip
            python39Packages.virtualenv
            python39Packages.numpy
            pythonManylinuxPackages.manylinux2014Package
            cmake
            ninja
            gcc
            pre-commit
          ]);
          runScript = "${pkgs.writeShellScriptBin "runScript" (''
              set -e
              test -d .venv || ${pkgs.python3.interpreter} -m venv .venv
              source .venv/bin/activate
              set +e
            ''
            + script)}/bin/runScript";
        })
        .env;
    in {
      devShell = envWithScript "bash";
    });
}