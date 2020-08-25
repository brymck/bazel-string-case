Bazel String Case
=================

[![Build status](https://badge.buildkite.com/02cc478cbbc4c754a64896dfce93c8efc8f8695f611d17fef8.svg)](https://buildkite.com/brymck-dot-io/bazel-string-case)

This library provides functions to Bazel to enable easy casing of strings. It's written in pure Starlark and has no
third-party dependencies.

Usage
-----

Create a file at the top of your repository called `WORKSPACE` and add the following to it:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_string_case",
    sha256 = "0bae76ce6883696e5df9669aa14911e7e5d131823e87d66dbedf5c495db159c9",
    strip_prefix = "bazel-string-case-0.0.1",
    urls = [
        "https://github.com/brymck/bazel-string-case/archive/v0.0.1.tar.gz",
    ],
)
```

Then in one of your `BUILD` or `*.bzl` files, use it as follows:

```
load("@bazel_string_case//:defs.bzl", "pascal_case")

print(pascal_case("foo_bar"))
```
