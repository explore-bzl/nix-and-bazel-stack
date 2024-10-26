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
    name = "gcc_toolchain",
    integrity = "sha256-iqcSkkfwbhKrNWeX957qE/I4fzKuj3GEB06OZAJ5Apk=",
    strip_prefix = "gcc-toolchain-0.6.0",
    patches = [
        "//bazel:0001-feat-posix-compliant-gcc-wrapper.patch",
    ],
    patch_args = ["-p1"],
    urls = [
        "https://github.com/f0rmiga/gcc-toolchain/archive/refs/tags/0.6.0.tar.gz",
    ],
)

load(
    "@gcc_toolchain//toolchain:repositories.bzl",
    "gcc_toolchain_dependencies",
)

gcc_toolchain_dependencies()

load(
    "@bazel_skylib//:workspace.bzl",
    "bazel_skylib_workspace",
)

bazel_skylib_workspace()

load(
    "@aspect_bazel_lib//lib:repositories.bzl",
    "aspect_bazel_lib_dependencies",
)

aspect_bazel_lib_dependencies()

load(
    "@gcc_toolchain//toolchain:defs.bzl",
    "ARCHS",
    "gcc_register_toolchain",
)

gcc_register_toolchain(
    name = "gcc_toolchain_x86_64",
    target_arch = ARCHS.x86_64,
    target_compatible_with = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
)
