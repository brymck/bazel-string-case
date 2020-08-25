load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":camel_case.bzl", "camel_case")

def _camel_case_test_impl(ctx):
    env = unittest.begin(ctx)
    tt = [
        ["", ""],
        ["test", "test"],
        ["test string", "testString"],
        ["Test String", "testString"],
        ["TestV2", "testV2"],
        ["_foo_bar_", "fooBar"],
        ["version 1.2.10", "version_1_2_10"],
        ["version 1.21.0", "version_1_21_0"],
    ]
    for t in tt:
        asserts.equals(env, t[1], camel_case(t[0]))
    return unittest.end(env)

camel_case_test = unittest.make(_camel_case_test_impl)

def camel_case_test_suite(name):
    unittest.suite(
        name,
        camel_case_test,
    )
