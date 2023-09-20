# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs }:

{
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  python3Packages = pkgs.recurseIntoAttrs rec {
    antspyx = pkgs.python3.pkgs.callPackage ./pkgs/antspyx { };

    highdicom = pkgs.python3.pkgs.callPackage ./pkgs/highdicom { inherit pillow-jpls; };

    ipyannotations = pkgs.python3.pkgs.callPackage ./pkgs/ipyannotations { inherit ipyevents; };

    ipyevents = pkgs.python3.pkgs.callPackage ./pkgs/ipyevents { };

    logging_tree = pkgs.python3.pkgs.callPackage ./pkgs/logging_tree { };

    logx = pkgs.python3.pkgs.callPackage ./pkgs/logx { inherit logging_tree; };

    mdai = pkgs.python3.pkgs.callPackage ./pkgs/mdai { };

    pgnotify = pkgs.python3.pkgs.callPackage ./pkgs/pgnotify { inherit logx; };

    pillow-jpls = pkgs.python3.pkgs.callPackage ./pkgs/pillow-jpls { };

    superintendent = pkgs.python3.pkgs.callPackage ./pkgs/superintendent { inherit ipyevents; };
  };
}
