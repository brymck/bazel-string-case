load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":pascal_case.bzl", "pascal_case")

def _pascal_case_test_impl(ctx):
    env = unittest.begin(ctx)
    tt = [
        ["", ""],
        ["test", "Test"],
        ["test string", "TestString"],
        ["Test String", "TestString"],
        ["TestV2", "TestV2"],
        ["version 1.2.10", "Version_1_2_10"],
        ["version 1.21.0", "Version_1_21_0"],
    ]
    for t in tt:
        asserts.equals(env, t[1], pascal_case(t[0]))
    return unittest.end(env)

pascal_case_test = unittest.make(_pascal_case_test_impl)

def pascal_case_test_suite(name):
    unittest.suite(
        name,
        pascal_case_test,
    )
