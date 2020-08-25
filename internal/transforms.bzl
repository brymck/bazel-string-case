load(":character_classes.bzl", "is_numeric")

def transform_to_lower_case(parts):
    for i in range(len(parts)):
        parts[i] = parts[i].lower()
    return parts

def transform_to_camel_case(parts):
    for i in range(len(parts)):
        if i == 0:
            parts[i] = parts[i].lower()
        else:
            part = parts[i]
            first = part[0]
            rest = part[1:].lower()
            if is_numeric(first):
                parts[i] = "_" + first + rest
            else:
                parts[i] = first.upper() + rest
    return parts

def transform_to_pascal_case(parts):
    for i in range(len(parts)):
        part = parts[i]
        first = part[0]
        rest = part[1:].lower()
        if i > 0 and is_numeric(first):
            parts[i] = "_" + first + rest
        else:
            parts[i] = first.upper() + rest
    return parts

def transform_to_upper_case(parts):
    for i in range(len(parts)):
        parts[i] = parts[i].upper()
    return parts
