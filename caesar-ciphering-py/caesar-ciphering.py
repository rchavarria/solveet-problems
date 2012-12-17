#
# solucion a cifrado César en python
#
lowercase_alphabet = "abcdefghijklmnopqrstuvwxyz"
uppercase_alphabet = lowercase_alphabet.upper()
dictionaries = [lowercase_alphabet, uppercase_alphabet]

def shift_character(character, offset):
    for d in dictionaries:
        idx = d.find(character)
        if(idx >= 0): return d[(idx + offset) % len(d)]

    return character

def shift(message, offset):
    shifted = []
    [ shifted.append( shift_character(char, offset) ) for char in message ]
    return "".join(shifted)

def cipher(message, offset):
    return shift(message, offset)

def decipher(message, offset):
    return shift(message, -1 * offset)

# simple ciphering
assert "d" == cipher("a", 3)
assert "a" == decipher("d", 3)
assert "ibm" == cipher("hal", 1)
assert "hal" == decipher("ibm", 1)
# uppercase ciphering
assert "IBM" == cipher("HAL", 1)
assert "HAL" == decipher("IBM", 1)
# ciphering over the dictionary limit
assert "a" == cipher("z", 1)
assert "Z" == decipher("A", 1)
assert "yZAb" == cipher("wXYz", 2)
assert "wXYz" == decipher("yZAb", 2)
# ciphering characters out of any dictionary
assert "?" == cipher("?", 5)
assert "!" == decipher("!", 9)
assert "," == cipher(",", 2)
assert "." == decipher(".", 100)
# cheking limits
assert "abc" == cipher("abc", len(lowercase_alphabet))
assert "abc" == decipher("abc", len(lowercase_alphabet))
