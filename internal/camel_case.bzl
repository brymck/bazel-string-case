load(":tokenize.bzl", "tokenize")
load(":transforms.bzl", "transform_to_camel_case")

def camel_case(s):
    parts = tokenize(s)
    parts = transform_to_camel_case(parts)
    return "".join(parts)
