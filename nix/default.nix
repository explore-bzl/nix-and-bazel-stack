{nixpkgs}: let
  customCallPackage = extraPkgs:
    nixpkgs.lib.callPackageWith (
      nixpkgs
      // extraPkgs
      // {
        callPackage = nixpkgs.lib.callPackageWith (
          nixpkgs // extraPkgs
        );
      }
    );
in rec {
  devShell = (customCallPackage {}) ./devShell.nix {};
}
