load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":snake_case.bzl", "snake_case")

def _snake_case_test_impl(ctx):
    env = unittest.begin(ctx)
    tt = [
        ["", ""],
        ["_id", "id"],
        ["test", "test"],
        ["test string", "test_string"],
        ["Test String", "test_string"],
        ["TestV2", "test_v2"],
        ["version 1.2.10", "version_1_2_10"],
        ["version 1.21.0", "version_1_21_0"]
    ]
    for t in tt:
        asserts.equals(env, t[1], snake_case(t[0]))
    return unittest.end(env)

snake_case_test = unittest.make(_snake_case_test_impl)

def snake_case_test_suite(name):
    unittest.suite(
        name,
        snake_case_test,
    )
