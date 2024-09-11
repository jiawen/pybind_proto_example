load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def declare_com_google_protobuf():
    # Use protobuf 21.7 since rules_proto 5.3.0-21.7 specifies that version.
    # Bazel 8 will remove the native proto_library and rules_proto will be the only toolchain provider.
    #
    # TODO(jiawen): remove the patch once it's upstreamed.
    # TODO(jiawen): Investigate how rules_proto below pulls in com_google_protobuf
    # implicitly and why rules_proto or rules_python pulls in the wrong version when
    # protobuf_deps() is called.
    maybe(
        http_archive,
        name = "com_google_protobuf",
        patch_args = ["-p1"],
        patches = ["//patches:com_google_protobuf.patch"],
        sha256 = "75be42bd736f4df6d702a0e4e4d30de9ee40eac024c4b845d17ae4cc831fe4ae",
        strip_prefix = "protobuf-21.7",
        urls = [
            "https://mirror.bazel.build/github.com/protocolbuffers/protobuf/archive/v21.7.tar.gz",
            "https://github.com/protocolbuffers/protobuf/archive/v21.7.tar.gz",
        ],
    )

def declare_rules_proto():
    maybe(
        http_archive,
        name = "rules_proto",
        sha256 = "dc3fb206a2cb3441b485eb1e423165b231235a1ea9b031b4433cf7bc1fa460dd",
        strip_prefix = "rules_proto-5.3.0-21.7",
        urls = [
            "https://github.com/bazelbuild/rules_proto/archive/refs/tags/5.3.0-21.7.tar.gz",
        ],
    )

def declare_rules_python():
    maybe(
        http_archive,
        name = "rules_python",
        sha256 = "c68bdc4fbec25de5b5493b8819cfc877c4ea299c0dcb15c244c5a00208cde311",
        strip_prefix = "rules_python-0.31.0",
        urls = [
            "https://github.com/bazelbuild/rules_python/releases/download/0.31.0/rules_python-0.31.0.tar.gz",
        ],
    )

# pybind11, pybind11_bazel, pybind11_abseil, and pybind11_protobuf.
# For this example, we technically don't need pybind11_abseil but we pull it in
# anyway since pybind11_protobuf references @@com_google_absl//absl:meta.
def declare_pybind_stack():
    maybe(
        http_archive,
        name = "com_google_absl",
        sha256 = "f50e5ac311a81382da7fa75b97310e4b9006474f9560ac46f54a9967f07d4ae3",
        strip_prefix = "abseil-cpp-20240722.0",
        urls = [
            "https://github.com/abseil/abseil-cpp/archive/refs/tags/20240722.0.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "pybind11",
        build_file = "@pybind11_bazel//:pybind11.BUILD",
        sha256 = "d475978da0cdc2d43b73f30910786759d593a9d8ee05b1b6846d1eb16c6d2e0c",
        strip_prefix = "pybind11-2.11.1",
        urls = [
            "https://github.com/pybind/pybind11/archive/refs/tags/v2.11.1.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "pybind11_bazel",
        sha256 = "e2ba5f81f3bf6a3fc0417448d49389cc7950bebe48c42c33dfeb4dd59859b9a4",
        strip_prefix = "pybind11_bazel-2.11.1.bzl.2",
        urls = [
            "https://github.com/pybind/pybind11_bazel/releases/download/v2.11.1.bzl.2/pybind11_bazel-2.11.1.bzl.2.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "pybind11_abseil",
        sha256 = "0495f01a90257f374762e2d8ea1c496626ebcc7a1a94275328fe85acd874fcb3",
        strip_prefix = "pybind11_abseil-13bcc721a3208632c2faf1efa0b06f7849f850ac",
        urls = [
            "https://github.com/pybind/pybind11_abseil/archive/13bcc721a3208632c2faf1efa0b06f7849f850ac.zip",
        ],
    )

    # TODO(jiawen): Update pybind11_protobuf to commit 1002ae3726598fa96a34b2b3ad035f2bbd3d6114.
    # Requires that we update protobuf concurrently because commit 1002ae3726598fa96a34b2b3ad035f2bbd3d6114
    # depends on @com_google_protobuf//python, which is not available in protobuf-3.19.4.
    maybe(
        http_archive,
        name = "pybind11_protobuf",
        sha256 = "c7ab64b1ccf9a678694a89035a8c865a693e4e872803778f91f0965c2f281d78",
        strip_prefix = "pybind11_protobuf-80f3440cd8fee124e077e2e47a8a17b78b451363",
        urls = [
            "https://artifactory.corp.adobe.com/artifactory/generic-nextcam-dev/third_party/pybind/pybind11_protobuf/80f3440cd8fee124e077e2e47a8a17b78b451363.zip",
            "https://artifactory-uw2.adobeitc.com/artifactory/generic-nextcam-dev/third_party/pybind/pybind11_protobuf/80f3440cd8fee124e077e2e47a8a17b78b451363.zip",
            "https://github.com/pybind/pybind11_protobuf/archive/80f3440cd8fee124e077e2e47a8a17b78b451363.zip",
        ],
    )
