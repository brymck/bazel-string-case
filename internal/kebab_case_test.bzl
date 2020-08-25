load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":kebab_case.bzl", "kebab_case")

def _kebab_case_test_impl(ctx):
    env = unittest.begin(ctx)
    tt = [
        ["", ""],
        ["test", "test"],
        ["test string", "test-string"],
        ["Test String", "test-string"],
        ["TestV2", "test-v2"],
        ["version 1.2.10", "version-1-2-10"],
        ["version 1.21.0", "version-1-21-0"],
    ]
    for t in tt:
        asserts.equals(env, t[1], kebab_case(t[0]))
    return unittest.end(env)

kebab_case_test = unittest.make(_kebab_case_test_impl)

def kebab_case_test_suite(name):
    unittest.suite(
        name,
        kebab_case_test,
    )
