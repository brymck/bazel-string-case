load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":lower_case.bzl", "lower_case")

def _lower_case_test_impl(ctx):
    env = unittest.begin(ctx)
    tt = [
        ["", ""],
        ["test", "test"],
        ["test string", "teststring"],
        ["Test String", "teststring"],
        ["TestV2", "testv2"],
        ["version 1.2.10", "version1210"],
        ["version 1.21.0", "version1210"],
    ]
    for t in tt:
        asserts.equals(env, t[1], lower_case(t[0]))
    return unittest.end(env)

lower_case_test = unittest.make(_lower_case_test_impl)

def lower_case_test_suite(name):
    unittest.suite(
        name,
        lower_case_test,
    )
