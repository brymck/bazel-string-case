load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":path_case.bzl", "path_case")

def _path_case_test_impl(ctx):
    env = unittest.begin(ctx)
    tt = [
        ["", ""],
        ["test", "test"],
        ["test string", "test/string"],
        ["Test String", "test/string"],
        ["TestV2", "test/v2"],
        ["version 1.2.10", "version/1/2/10"],
        ["version 1.21.0", "version/1/21/0"]
    ]
    for t in tt:
        asserts.equals(env, t[1], path_case(t[0]))
    return unittest.end(env)

path_case_test = unittest.make(_path_case_test_impl)

def path_case_test_suite(name):
    unittest.suite(
        name,
        path_case_test,
    )
