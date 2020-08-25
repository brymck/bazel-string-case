load("@bazel_skylib//lib:unittest.bzl", "asserts", "unittest")
load(":dot_case.bzl", "dot_case")

def _dot_case_test_impl(ctx):
    env = unittest.begin(ctx)
    tt = [
        ["", ""],
        ["test", "test"],
        ["test string", "test.string"],
        ["Test String", "test.string"],
        ["dot.case", "dot.case"],
        ["path/case", "path.case"],
        ["TestV2", "test.v2"],
        ["version 1.2.10", "version.1.2.10"],
        ["version 1.21.0", "version.1.21.0"],
    ]
    for t in tt:
        asserts.equals(env, t[1], dot_case(t[0]))
    return unittest.end(env)

dot_case_test = unittest.make(_dot_case_test_impl)

def dot_case_test_suite(name):
    unittest.suite(
        name,
        dot_case_test,
    )
