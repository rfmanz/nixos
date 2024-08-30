with (import <nixpkgs> {});
stdenv.mkDerivation {
  name = "pip-env";
  buildInputs = [
    readline
    python39Full
    python39Packages.virtualenv
    python39Packages.pip
    python39Packages.setuptools
    python39Packages.numpy    
  ];

  shellHook = ''
    # Allow the use of wheels.
    SOURCE_DATE_EPOCH=$(date +%s)

    # Augment the dynamic linker path
    # export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib";
    export LD_LIBRARY_PATH="${pkgs.libGL}/lib/:${pkgs.stdenv.cc.cc.lib}/lib/:${pkgs.glib.out}/lib/";

  '';


}
