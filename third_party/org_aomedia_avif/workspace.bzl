# Copyright 2020 The TensorStore Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Examples of building libavif using bazel are hard to find.
# https://github.com/tensorflow/io

load(
    "//third_party:repo.bzl",
    "third_party_http_archive",
)
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def repo():
    maybe(
        third_party_http_archive,
        name = "org_aomedia_avif",
        urls = [
            "https://github.com/AOMediaCodec/libavif/archive/cd0bb358f83d01867f0fa53079470043618c9af5.tar.gz",  # main(2022-09-30)
        ],
        sha256 = "7ebef5d60279671dcc8d13ebaba2ab8b2580a2a9e2bb0e9aaa72fd8083ff49c3",
        strip_prefix = "libavif-cd0bb358f83d01867f0fa53079470043618c9af5",
        build_file = Label("//third_party:org_aomedia_avif/libavif.BUILD.bazel"),
        system_build_file = Label("//third_party:org_aomedia_avif/system.BUILD.bazel"),
        cmake_name = "AVIF",
        bazel_to_cmake = {},
        cmake_target_mapping = {
            "//:avif": "AVIF::AVIF",
        },
        cmake_package_redirect_libraries = {
            "AVIF": "AVIF::AVIF",
        },
    )
