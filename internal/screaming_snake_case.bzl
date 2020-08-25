load(":tokenize.bzl", "tokenize")
load(":transforms.bzl", "transform_to_upper_case")

def screaming_snake_case(s):
    parts = tokenize(s)
    parts = transform_to_upper_case(parts)
    return "_".join(parts)
