load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":screaming_snake_case.bzl", "screaming_snake_case")

def _screaming_snake_case_test_impl(ctx):
    env = unittest.begin(ctx)
    tt = [
        ["", ""],
        ["test", "TEST"],
        ["test string", "TEST_STRING"],
        ["Test String", "TEST_STRING"],
        ["dot.case", "DOT_CASE"],
        ["path/case", "PATH_CASE"],
        ["TestV2", "TEST_V2"],
        ["version 1.2.10", "VERSION_1_2_10"],
        ["version 1.21.0", "VERSION_1_21_0"]
    ]
    for t in tt:
        asserts.equals(env, t[1], screaming_snake_case(t[0]))
    return unittest.end(env)

screaming_snake_case_test = unittest.make(_screaming_snake_case_test_impl)

def screaming_snake_case_test_suite(name):
    unittest.suite(
        name,
        screaming_snake_case_test,
    )
