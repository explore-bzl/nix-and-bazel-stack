load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)

http_archive(
    name = "rules_cc",
    sha256 = "2037875b9a4456dce4a79d112a8ae885bbc4aad968e6587dca6e64f3a0900cdf",
    strip_prefix = "rules_cc-0.0.9",
    urls = [
        "https://github.com/bazelbuild/rules_cc/releases/download/0.0.9/rules_cc-0.0.9.tar.gz",
    ],
)

http_archive(
    name = "platforms",
    sha256 = "218efe8ee736d26a3572663b374a253c012b716d8af0c07e842e82f238a0a7ee",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/platforms/releases/download/0.0.10/platforms-0.0.10.tar.gz",
        "https://github.com/bazelbuild/platforms/releases/download/0.0.10/platforms-0.0.10.tar.gz",
    ],
)

http_archive(
    name = "starterkit",
    sha256 = "5bc6c5115eadf771a1feb57a8ab125618b6289d1c4ea5bcbfe71b30b90335938",
    strip_prefix = "starterkit-0.9.1",
    patches = [
        "//bazel:0001-chore-lowercase-OSFamily-property-value.patch",
    ],
    patch_args = ["-p1"],
    urls = [
        "https://github.com/explore-bzl/starterkit/archive/refs/tags/v0.9.1.tar.gz",
    ],
)

http_archive(
    name = "io_tweag_rules_nixpkgs",
    sha256 = "1adb04dc0416915fef427757f4272c4f7dacefeceeefc50f683aec7f7e9b787a",
    strip_prefix = "rules_nixpkgs-0.12.0",
    urls = [
        "https://github.com/tweag/rules_nixpkgs/releases/download/v0.12.0/rules_nixpkgs-0.12.0.tar.gz",
    ],
)

load(
    "@io_tweag_rules_nixpkgs//nixpkgs:repositories.bzl",
    "rules_nixpkgs_dependencies",
)

rules_nixpkgs_dependencies()

load(
    "@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl",
    "nixpkgs_cc_configure",
    "nixpkgs_local_repository",
)

nixpkgs_local_repository(
    name = "nixpkgs",
    nix_file_content = "import (import ./nix/sources.nix).nixpkgs",
    nix_file_deps = [
        "//:nix/sources.nix",
        "//:nix/sources.json",
    ],
)

nixpkgs_cc_configure(
    name = "nix_config_cc",
    attribute_path = "gcc",
    exec_constraints = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    register = True,
    repository = "@nixpkgs",
    target_constraints = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
)
