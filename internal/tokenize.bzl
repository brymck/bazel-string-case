load(":character_classes.bzl", "is_alphanumeric", "is_lower_case_letter", "is_numeric", "is_upper_case_letter")

def tokenize(s):
    queue = []
    parts = []
    part = ""
    for i in range(len(s)):
        ch = s[i]
        if is_alphanumeric(ch):
            if len(queue) == 2:
                if is_upper_case_letter(ch):
                    if is_lower_case_letter(queue[0]) or is_numeric(queue[0]):
                        part = part + queue.pop() + queue.pop()
                        parts.append(part)
                        part = ""
                    else:
                        part = part + queue.pop()
                elif is_lower_case_letter(ch):
                    if is_upper_case_letter(queue[0]) and is_upper_case_letter(queue[1]):
                        part = part + queue.pop()
                        parts.append(part)
                        part = ""
                    else:
                        part = part + queue.pop()
                else:
                    part = part + queue.pop()
            elif len(queue) == 1:
                if is_upper_case_letter(ch):
                    if is_lower_case_letter(queue[0]) or is_numeric(queue[0]):
                        part = part + queue.pop()
                        parts.append(part)
                        part = ""
            queue.insert(0, ch)
        else:
            count = len(queue)
            for _ in range(count):
                part = part + queue.pop()
            if part != "":
                parts.append(part)
            part = ""

    # Drain queue
    count = len(queue)
    for _ in range(count):
        part = part + queue.pop()
    if part != "":
        parts.append(part)

    return parts
