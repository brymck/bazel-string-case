load(":tokenize.bzl", "tokenize")
load(":transforms.bzl", "transform_to_lower_case")

def no_case(s):
    parts = tokenize(s)
    parts = transform_to_lower_case(parts)
    return " ".join(parts)
