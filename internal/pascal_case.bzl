load(":tokenize.bzl", "tokenize")
load(":transforms.bzl", "transform_to_pascal_case")

def pascal_case(s):
    parts = tokenize(s)
    parts = transform_to_pascal_case(parts)
    return "".join(parts)
