load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":tokenize.bzl", "tokenize")

def _tokenize_test_impl(ctx):
    env = unittest.begin(ctx)
    asserts.equals(env, ["camel", "Case"], tokenize("camelCase"))
    asserts.equals(env, ["CAMEL", "Case"], tokenize("CAMELCase"))
    return unittest.end(env)

tokenize_test = unittest.make(_tokenize_test_impl)

def tokenize_test_suite(name):
    unittest.suite(
        name,
        tokenize_test,
    )
