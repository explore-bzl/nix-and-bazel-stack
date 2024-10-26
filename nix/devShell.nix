{
  lib,
  mkShellNoCC,
  bazel_7,
  nix,
} @ args: let
  packages = lib.attrsets.attrValues (
    builtins.removeAttrs args ["mkShellNoCC" "lib"]
  );
in
  mkShellNoCC {
    inherit packages;
    name = "nix-and-bazel-shell";

    shellHook = ''
    '';
  }