_lower_case_letters = {
    "a": True,
    "b": True,
    "c": True,
    "d": True,
    "e": True,
    "f": True,
    "g": True,
    "h": True,
    "i": True,
    "j": True,
    "k": True,
    "l": True,
    "m": True,
    "n": True,
    "o": True,
    "p": True,
    "q": True,
    "r": True,
    "s": True,
    "t": True,
    "u": True,
    "v": True,
    "w": True,
    "x": True,
    "y": True,
    "z": True,
}

_upper_case_letters = {
    "A": True,
    "B": True,
    "C": True,
    "D": True,
    "E": True,
    "F": True,
    "G": True,
    "H": True,
    "I": True,
    "J": True,
    "K": True,
    "L": True,
    "M": True,
    "N": True,
    "O": True,
    "P": True,
    "Q": True,
    "R": True,
    "S": True,
    "T": True,
    "U": True,
    "V": True,
    "W": True,
    "X": True,
    "Y": True,
    "Z": True,
}

_numbers = {
    "0": True,
    "1": True,
    "2": True,
    "3": True,
    "4": True,
    "5": True,
    "6": True,
    "7": True,
    "8": True,
    "9": True,
}

def is_alphanumeric(s):
    return s in _lower_case_letters or s in _upper_case_letters or s in _numbers

def is_alpha(s):
    return s in _lower_case_letters or s in _upper_case_letters

def is_lower_case_letter(s):
    return s in _lower_case_letters

def is_upper_case_letter(s):
    return s in _upper_case_letters

def is_numeric(s):
    return s in _numbers